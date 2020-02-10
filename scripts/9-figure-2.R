# Figure 2
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
          'spatsoc',
          'rgdal',
          'asnipe',
          'igraph', 
          'ScaleInMultilayerNetworks',
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


### Setup data for plotting ----
# Generate a single set of xy (so each layer has consistent individual positions)
ggnet1 <- data.table(ggnetwork(gLs[['winter-2']], layout = 'kamadakawai'))
xy <- unique(ggnet1[, .(x, y, vertex.names)])

# Shear the xy
shear_xy(xy, c('x', 'y'))

# Rep the rows for each layer (since each layer is present in each landcover * season)
repxy <- xy[rep(seq_len(nrow(xy)), times = 6)]
repxy[, layer := rep(names(gLs), each = uniqueN(vertex.names))]

# Edges by layer
edges <- rbindlist(lapply(gLs, as_data_frame, what = 'edges'), idcol = 'layer')
edges[, c(lccol, 'season') := tstrsplit(layer, '-', type.convert = TRUE)]

# Yuck double merge for from and to coords
mxby <- c('vertex.names', 'layer')
myby <- c('from', 'layer')
xyedges <- merge(repxy,
                 edges,
                 by.x = mxby,
                 by.y = myby,
                 all = TRUE)
myby <- c('to', 'layer')
zzz <-
  merge(
    repxy,
    xyedges,
    by.x = mxby,
    by.y = myby,
    suffixes = c('', 'end'),
    all = TRUE
  )

# Manual positioning left/right and up/down stacks
slideright <- 2.75
zzz[layer %in% c('winter-3', 'summer-3'), 
    c('modx', 'mody') := .(slideright * (.GRP - 1), 0), by = layer]

zzz[layer %in% c('winter-2', 'summer-2'), 
    c('modx', 'mody') := .(slideright * (.GRP - 1), 2), by = layer]

zzz[layer %in% c('winter-1', 'summer-1'), 
    c('modx', 'mody') := .(slideright * (.GRP - 1), 4), by = layer]


### Plot ----
p <- theme(legend.text = element_text(size = 12, color = "black"),
           legend.title = element_blank(),
           legend.spacing = unit(-0.5, 'cm'),
           legend.background = element_blank(),
           legend.key = element_blank(),
           axis.text = element_blank(),
           axis.title = element_blank(),
           axis.ticks = element_blank(),
           panel.grid.minor = element_blank(),
           panel.background = element_blank(),
           panel.border = element_rect(
             colour = "black",
             fill = NA,
             size = 1))

labels <- data.table(
  x = rep(c(1.5, 4.25), 3),
  y = rep(c(1.25, 3.25, 5.25), each = 2),
  label = c('summer-3', 'winter-3',
            'summer-2', 'winter-2',
            'summer-1', 'winter-1')
)

(gnn <- ggplot(
    zzz,
    aes(
      x = shearx + modx,
      y = sheary + mody,
      xend = shearxend + modx,
      yend = shearyend + mody
    )
  ) +
    geom_nodes(aes(color = vertex.names), size = 5) +
    geom_edges(aes(group = layer)) +
    guides(color = FALSE) +
    geom_text(aes(x, y, xend = NULL, yend = NULL, label = label), data = labels) + 
  p
)

# TODO: do we want edge weights by SRI?


ggsave('graphics/figure-2.png', width = 8, height = 6)

