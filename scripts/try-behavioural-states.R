### Scale in multilayer networks - behavioural states
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
          'ggplot2',
          'spatsoc',
          'moveHMM',
          'asnipe',
          'igraph',
          'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- readRDS('data/derived-data/1-sub-fogo-caribou.Rds')
alloc.col(DT)


### moveHMM ----
setorderv(DT, cols = c(idcol, datecol))
prepDT <-
  prepData(DT[, .(EASTING, NORTHING, ID = get(idcol))],
           type = 'UTM', coordNames = projCols)

# TODO: randomize + compare m
stepPar0 = c(100, 1000, 100, 1000, 0.01, 0.001)
anglePar0 = c(pi, 0, 0.1, 2)

m <- fitHMM(
  data = prepDT,
  nbStates = 2,
  stepPar0 = stepPar0,
  anglePar0 = anglePar0
)

# TODO: Some of the parameter estimates seem to lie close to the boundaries of their parameter space.
#       The associated CIs are probably unreliable (or might not be computable).

DT[, state := viterbi(m)]


### Temporal grouping with spatsoc ----
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)


var <- 'state'
splitBy <- c('season', var)
sub <- na.omit(DT, cols = splitBy)

# Spatial grouping with spatsoc
group_pts(
  sub,
  threshold = spatthresh,
  id = idcol,
  coords = projCols,
  timegroup = 'timegroup',
  splitBy = splitBy
)
  
# GBI for each season * state
gbiLs <- list_gbi(sub, idcol, splitBy)
  
# Generate networks for each season * state
netLs <- list_nets(gbiLs)
  
# Generate graphs for each season * state
gLs <- list_graphs(netLs)
names(gLs) <- names(gbiLs)
  
# Calculate eigenvector centrality for each season * state
stren <- layer_strength(gLs)
stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
setnames(stren, 'ind', idcol)
  
# Calculate neighbors
layer_neighbors(sub, idcol, splitBy = splitBy)

# and tidy output, prep for merge
outcols <- c('neigh', 'splitNeigh', idcol, splitBy)
out <- unique(sub[, .SD, .SDcols = outcols])
  
# Merge eigcent+correlations with neighbors
out <- out[stren, on = c(idcol, splitBy)]

### Metrics ----
DT <- out

### Multilayer network metrics ----
matrices <- DT[, property_matrix(.SD, idcol, 'layer', 'splitNeigh'), var]
matrices[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]

layer_similarity(matrices, 'FO', var)

DT[matrices, layersim := layersim, on = splitBy]

# Multidegree
multi_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Redundancy
# TODO: hmm
# connective_redudancy(DT)
# stopifnot(DT[!between(connredund, 0, 1), .N] == 0)


# Degree deviation
deviation_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Relevance
layer_relevance(DT, idcol, splitBy = splitBy)
stopifnot(DT[!between(relev, 0, 1), .N] == 0)

### Plots ----
## Manuscript figures
# Legend position
pos1 <- c(0.85, 0.35)
pos2 <- c(0.85, 0.3)

# Theme
p <- theme(legend.text = element_text(size = 12, color = "black"),
           legend.title = element_blank(),
           legend.spacing = unit(-0.5, 'cm'),
           legend.background = element_blank(),
           legend.key = element_blank(),
           axis.text.x = element_text(size = 14, color = "black", vjust = 0.65),
           axis.text.y = element_text(size = 14, color = "black"),
           axis.title = element_text(size = 18),
           panel.grid.minor = element_blank(),
           panel.background = element_blank(),
           panel.border = element_rect(
             colour = "black",
             fill = NA,
             size = 1))



## Colors
cols <- DT[, .(layer = sort(unique(layer)))][, 
                                             .(layer, hex = c('#8c510a','#d8b365',
                                                              '#01665e','#5ab4ac'))]

greys <- DT[, .(state = sort(unique(state)))][, 
                                        .(state, hex = c('#6b6b6b', '#c2c2c2'))]

# Linesize
linesize <- 1.3

# Plot by landcover
base1 <- ggplot(unique(DT[, .SD, .SDcols = c(var, 'layersim')]), 
                aes(x = factor(get(var))))

g1 <-
  base1 + geom_point(aes(y = layersim)) + 
  ylab('Layer Similarity') +
  expand_limits(y = c(-1, 1)) +
  geom_hline(yintercept = 0) +  
  theme(legend.position = pos2) 

# Plot full, across
base2 <- ggplot(DT, aes(x = factor(get(var)), color = get(idcol), group = get(idcol)))

g2 <- base2 + geom_line(aes(y = multideg)) + ylab('Multidegree')
g3 <- base2 + geom_line(aes(y = degdev)) + ylab('Degree Deviation')
# g4 <- base2 + geom_line(aes(y = neigh)) + ylab('Neighborhood')

# g5 <- base2 + geom_line(aes(y = connredund)) + 
#   ylab('Connective Redundancy') +
#   expand_limits(y = c(-0.075, 1))


# Plot within
base3 <- ggplot(DT, aes(x = factor(get(var)), color = get(idcol), group = get(idcol))) +
  facet_wrap(~season)
  # scale_color_manual(values = c(cols$hex[1], cols$hex[5])) 

g6 <- base3 + geom_line(aes(y = splitNeigh)) + ylab('Degree')

g7 <- base3 + geom_line(aes(y = relev)) + 
  ylab('Layer Relevance') + guides(color = FALSE, linetype = FALSE) +
  expand_limits(y = c(-0.075, 1))

g8 <- base3 + geom_line(aes(y = graphstrength)) + 
  ylab('Graph Strength') + guides(linetype = FALSE) + 
  expand_limits(y = c(-0.075, 1)) + 
  theme(legend.position = pos1) +
  guides(color = FALSE)


# Patchwork
(fig <- (g8 + g6) / (g1 + g3) +
    plot_annotation(tag_levels = 'A') & 
    theme(plot.tag = element_text(size = 14, hjust = 0, vjust = 0),
          legend.key.width = unit(1.4,"cm")) &
    labs(x = varnames[vars == var, varname]) &
    scale_linetype_manual(
      values = c("forest" = "dashed", "open" = "dotted", "forage" = "solid")) &
    p)

### Output ----
saveRDS(out, 'data/derived-data/5-number-of-observations.Rds')
