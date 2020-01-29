### Plots ====
# Alec Robitaille


### Packages ----
pkgs <- c('data.table',
          'ggplot2',
          'patchwork')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
var <- 'winpos'

if (var == 'lcres') {
  DT <- readRDS('data/derived-data/2-landcover-scale.Rds')
} else if (var == 'spatialthreshold') {
  DT <- readRDS('data/derived-data/3-spatial-threshold.Rds')
} else if (var == 'winlength') {
  DT <- readRDS('data/derived-data/4-time-window-length.Rds')
} else if (var == 'nobs') {
  DT <- readRDS('data/derived-data/5-number-of-observations.Rds')
} else if (var == 'winpos') {
  DT <- readRDS('data/derived-data/6-time-window-position.Rds')
}

alloc.col(DT)


### Plots ----
## Manuscript figures

# To average columns...

# Full multilayer - layersd (no need to avg)

# Across layers - degree deviation, neigh, multideg, connredund
metriccols <- c('neigh', 'multideg', 'degdev', 'connredund')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = var]

# Within layers - splitNeigh, relev, connredund, graphstrength
metriccols <- c('splitNeigh', 'relev', 'graphstrength')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = c(var, splitBy)]

# Layer similarity
m <- melt(DT[, .SD, .SDcols = c('layer', layercols, var)], id.vars = c('layer', var))
m <- unique(na.omit(m))[, inter := paste(layer, variable)]
ggplot(na.omit(m))+geom_line(aes(get(var), value, color = inter)) + labs(x=var, y = 'layer similarity') #+ guides(color=FALSE)

# Plot full, across
g <- ggplot(DT[, .SD[1], by = var], aes(x = get(var))) +
  guides(color = FALSE) +
  labs(x = var)

g1 <- g + geom_line(aes(y = layersd), color = 'black') + ylab('Layer Similarity')
g2 <- g + geom_line(aes(y = mnmultideg)) + ylab('Multidegree')
g3 <- g + geom_line(aes(y = mndegdev)) + ylab('Degree Deviation')
g4 <- g + geom_line(aes(y = mnneigh)) + ylab('Neighborhood')
g5 <- g + geom_line(aes(y = mnconnredund)) + ylab('Connective Redundancy')


# Plot within
g <- ggplot(DT, aes(x = get(var), color = layer, group = layer)) +
  guides(color = FALSE) +
  labs(x = var)

g6 <- g + geom_line(aes(y = mnsplitNeigh)) + ylab('Degree')
g7 <- g + geom_line(aes(y = mnrelev)) + ylab('Relevance')
g8 <- g + geom_line(aes(y = mngraphstrength)) + ylab('Graph Strength')


# Patchwork
(g1 + g5) / (g7 + g8)


## Supplemental figures
(g1 + g2  + g3 + g4 + g5) / (g6 + g7 + g8)
  