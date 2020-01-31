# Figure 2

### Scale in multilayer networks - spatial threshold
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
          'spatsoc',
          'rgdal',
          'asnipe',
          'igraph', 
          'ScaleInMultilayerNetworks',
          # 'patchwork',
          # 'ggthemes',
          'ggnetwork')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- readRDS('data/derived-data/1-sub-seasons-fogo-caribou.Rds')
alloc.col(DT)

### Generate networks ----
# Drop where season or landcover is NA
DT <- DT[!is.na(season) & !is.na(get(lccol))]

# Temporal grouping with spatsoc
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = '10 minutes'
)

# Spatial grouping with spatsoc
group_pts(
  DT,
  threshold = spatthresh,
  id = idcol,
  coords = projCols,
  timegroup = 'timegroup',
  splitBy = splitBy
)

# GBI matrices
gbiLs <- list_gbi(DT, idcol, splitBy)

# Networks
netLs <- list_nets(gbiLs)

# Graphs
gLs <- list_graphs(netLs)
names(gLs) <- names(gbiLs)

# Restructure for plotting
bys <- c('season', lccol)

meanXY <- DT[, .(meanX = mean(get(xcol)), meanY = mean(get(ycol))), by = c(bys, idcol)]

edges <- rbindlist(lapply(gLs, as_data_frame, what = 'edges'), idcol = 'layer')
edges[, c(lccol, 'season') := tstrsplit(layer, '-', type.convert = TRUE)]

xyEdges <- merge(meanXY, edges, by.x = c(bys, idcol), by.y = c(bys, 'from'))

m <- merge(
  xyEdges,
  unique(xyEdges[, .SD, .SDcols = c(idcol, bys, 'meanX', 'meanY')]),
  by.x = c(bys, 'to'),
  by.y = c(bys, idcol),
  suffixes = c('', 'end')
)
setnames(m, c(idcol), c('from'))

f <- lapply(gLs, function(g) tryCatch(ggnetwork(g), error = function(g) g))

rbindlist(f[-3])
# TODO: MISSING INDIVIDUALS
(gnn <- ggplot(m, aes(
  x = meanX,
  y = meanY,
  xend = meanXend,
  yend = meanYend
)) +
  geom_edges(size = 1, alpha = 0.6) +
  geom_nodes(aes(color = from), size = 7, data =) +
  # geom_nodetext(aes(label = from)) +
  # scale_color_manual(breaks = DT$ID, values = pal) +
  facet_wrap(~season + lc30, dir = 'h') + 
  # guides(color = FALSE) + 
    scale_color_grey()#+
  # theme(axis.line = element_blank(),
  #       panel.border = element_rect(fill = NA)))
)


### Set theme ----
pal <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442")

theme_set(theme_classic())
theme_update(axis.text = element_blank(),
             axis.title = element_blank(),
             axis.ticks = element_blank(),
             aspect.ratio = 1)
# 
# fontSize <- 24
# gridTheme <- gridExtra::ttheme_default(
#   base_size = fontSize
# )

