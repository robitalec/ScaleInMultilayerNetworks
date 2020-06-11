# === Social Distance Threshold -------------------------------------------
# Alec Robitaille

# Input -------------------------------------------------------------------
pkgs <- c('data.table',
					'spatsoc',
					'rgdal',
					'asnipe',
					'igraph',
					'ggnetwork',
					'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/01-sub-fogo-caribou.Rds')
alloc.col(DT)

# Temporal grouping with spatsoc ------------------------------------------
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = '10 minutes'
)

# Generate networks for each spatial threshold ----------------------------
# list spatial thresholds
thresholds <- c(5, 25, 50, 75, 100, 250, 500)

var <- 'threshold'
splitBy <- 'lc'
ulc <- DT[!is.na(lc), unique(lc)]


graphs <- lapply(thresholds, function(thresh) {
  sub <- na.omit(DT, cols = 'lc')
  
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = thresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = splitBy
  )
  
  # GBI for each season
  gbiLs <- list_gbi(sub, idcol, splitBy)
  
  # Generate networks for each season
  netLs <- list_nets(gbiLs)
  
  # Generate graphs for each season
  gLs <- list_graphs(netLs)
  names(gLs) <- paste(names(gbiLs), thresh, sep = '-')
  
  # Calculate eigenvector centrality for each season
  stren <- layer_strength(gLs)
  setnames(stren, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = splitBy)
  
  # Calculate multidegree
  multi_degree(sub, 'splitNeigh', idcol, splitBy)
  
  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', 'multideg', idcol, splitBy)
  usub <- unique(sub[, .SD, .SDcols = outcols])
  usub[, layer := paste(lc, thresh, sep = '-')]
  
  # Merge eigcent+correlations with neighbors
  out <- usub[stren, on = c(idcol, 'layer')]
  
  # Preserve window length
  set(out, j = var, value = thresh)
  
  list(out = out, graph = gLs)
})

gLs <- unlist(lapply(graphs, function(x) x[['graph']]),
              recursive = FALSE)

outLs <- rbindlist(lapply(graphs, function(x) x[['out']]))

# Generate edge lists
eLs <- list_edges(gLs)

# Calculate edge overlap
eovr <- edge_overlap(eLs)

out <- outLs[eovr, on = 'layer']

# Generate figure data ----------------------------------------------------
# XY for each node
rbindxy <- rbindlist(lapply(gLs, ggnetwork), idcol = 'layer')
rbindxy[, c('lc', 'threshold') := tstrsplit(layer, '-', type.convert = TRUE)]
xy <- rbindxy[order(-threshold)][, .SD[1], by = .(lc, name), .SDcols = c('x', 'y')]

repxy <- xy[rep(seq_len(nrow(xy)), times = length(thresholds))]
repxy[, threshold := rep(unique(rbindxy$threshold), each = uniqueN(name) * length(ulc))]
repxy[, layer := paste(threshold, lc, sep = '-')]

# Edges by layer
edges <- rbindlist(lapply(gLs, as_data_frame, what = 'edges'), idcol = 'layer')

# Yuck double merge for from and to coords
mxby <- c('name', 'layer')
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
  )[!is.na(name)]



# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/04-spatial-threshold.Rds')
saveRDS(zzz, 'data/derived-data/04-spatial-threshold-fig-data.Rds')
