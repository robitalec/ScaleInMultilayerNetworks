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
meanXY <- DT[, .(meanX = mean(get(xcol)), meanY = mean(get(ycol))), by = idcol]

edges <- rbindlist(lapply(gLs, as_data_frame, what = 'edges'), idcol = 'layer')

xyEdges <- merge(meanXY, edges, by.x = idcol, by.y = 'from')

m <- merge(
  xyEdges,
  unique(xyEdges[, .SD, .SDcols = c(idcol, 'meanX', 'meanY')]),
  by.x = 'to',
  by.y = idcol,
  suffixes = c('', 'end')
)
setnames(m, c(idcol), c('from'))

m[, c(lccol, 'season') := tstrsplit(layer, '-', type.convert = TRUE)]

(gnn <- ggplot(m, aes(
  x = meanX,
  y = meanY,
  xend = meanXend,
  yend = meanYend
)) +
  geom_edges(aes(size = weight), alpha = 0.2) +
  geom_nodes(aes(color = from), size = 7) +
  # geom_nodetext(aes(label = from)) +
  # scale_color_manual(breaks = DT$ID, values = pal) +
  facet_wrap(~lc30 + season) + 
  guides(color = FALSE) +
  theme(axis.line = element_blank(),
        panel.border = element_rect(fill = NA)))



### Set theme ----
# pal <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442")
# 
# theme_set(theme_classic())
# theme_update(axis.text = element_blank(),
#              axis.title = element_blank(),
#              axis.ticks = element_blank(),
#              aspect.ratio = 1)
# 
# fontSize <- 24
# gridTheme <- gridExtra::ttheme_default(
#   base_size = fontSize
# )

