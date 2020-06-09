# === Social Distance Threshold -------------------------------------------
# Alec Robitaille

# Input -------------------------------------------------------------------
pkgs <- c('data.table',
					'spatsoc',
					'rgdal',
					'asnipe',
					'igraph', 
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
thresholds <- c(5, seq(50, 500, by = 50))

var <- 'spatialthreshold'
splitBy <- NULL

graphs <- lapply(thresholds, function(thresh) {
  sub <- copy(DT)
  
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = thresh,
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
  

# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/3-spatial-threshold.Rds')