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
thresholds <- c(5, 50, seq(100, 500, 100))
  # c(5, 25, 50, 75, 100, 125, 150, 275, 350, 500)#c(5, seq(50, 500, by = 50))

var <- 'spatialthreshold'
splitBy <- NULL

comb <- CJ(thresh = thresholds, lc = DT[!is.na(lc), unique(lc)])[1:3]

graphs <- lapply(seq_along(comb), function(i) {
  sellc <- comb[i, lc]
  selthresh <- comb[i, thresh]
  
  sub <- copy(DT)[lc == sellc]
  
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = selthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup'
  )
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = NULL)
  
  neighb <- unique(sub[, .(ANIMAL_ID, neigh, layer = thresh)])
  
  # GBI 
  gbi <- get_gbi(sub, id = idcol)
  
  # Generate networks 
  net <- get_network(gbi, data_format = 'GBI', association_index = 'SRI')
  
  # Generate graphs 
  list(graph = graph.adjacency(net, mode = 'undirected', diag = FALSE, weighted = TRUE),
       neighs = neighb)
})

gLs <- lapply(graphs, function(x) x[['graph']])
names(gLs) <- thresholds

neighLs <- rbindlist(lapply(graphs, function(x) x[['neighs']]))


# Generate edge lists
eLs <- list_edges(gLs)
eLs[, layer := as.integer(layer)]

# Calculate edge overlap
eovr <- edge_overlap(eLs)
eovr[, edgeoverlapmat := list(edge_overlap_mat(eLs))]

# Calculate eigenvector centrality 
stren <- layer_strength(gLs)
stren[, layer := as.integer(layer)]
stren[, (var) := layer]
setnames(stren, 'ind', idcol)
  
# and tidy output, prep for merge
usub <- neighLs

# Merge eigcent+correlations with neighbors
wstren <- usub[stren, on = c(idcol, 'layer')]
  
# Merge edge overlap
wedgeovr <- wstren[eovr, on = 'layer']

# Property matrix
matrices <- property_matrix(wedgeovr, idcol, 'neigh', var)
layer_similarity_ordinal(matrices, 'FO', var)
  
out <- wedgeovr[matrices[, .(layersim, layer)], on = 'layer']
  

# Generate figure data ----------------------------------------------------
# XY for each node
rbindxy <- rbindlist(lapply(gLs, ggnetwork), idcol = 'layer')
rbindxy[, layer := as.integer(layer)][, dif := abs(layer - median(layer))]
xy <- rbindxy[order(dif)][, .SD[1], by = name, .SDcols = c('x', 'y')]

repxy <- xy[rep(seq_len(nrow(xy)), times = length(thresholds))]
repxy[, layer := rep(names(gLs), each = uniqueN(name))]

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

zzz[, layerfctr := factor(layer, sort(unique(as.integer(layer))))]


# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/04-spatial-threshold.Rds')
saveRDS(zzz, 'data/derived-data/04-spatial-threshold-fig-data.Rds')
