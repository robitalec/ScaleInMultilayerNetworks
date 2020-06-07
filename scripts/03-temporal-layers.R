# === Temporal Layers -----------------------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
					'ggplot2',
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



# Chunk time --------------------------------------------------------------
nchunk <- 8

# TODO: check consistent N by cut * year
DT[, cutJDate := cut(JDate, nchunk, include.lowest = TRUE), by = Year]
DT[, timecut := .GRP, .(cutJDate, Year)]


# Temporal grouping with spatsoc ------------------------------------------
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)


# Generate network for each time chunk ------------------------------------
var <- 'timecut'
splitBy <- var

# Spatial grouping with spatsoc
group_pts(
  DT,
  threshold = spatthresh,
  id = idcol,
  coords = projCols,
  timegroup = 'timegroup',
  splitBy = splitBy
)
  
  
# GBI
gbiLs <- list_gbi(DT, idcol, splitBy)

# Generate networks
netLs <- list_nets(gbiLs)

# Generate graphs
gLs <- list_graphs(netLs)
names(gLs) <- names(gbiLs)

# Generate edge lists
eLs <- list_edges(gLs)

# Calculate edge overlap
eovr <- edge_overlap(eLs)
eovr[, edgeoverlapmat := list(edge_overlap_mat(eLs))]

# Calculate eigenvector centrality
stren <- layer_strength(gLs)
stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
setnames(stren, 'ind', idcol)

# Calculate neighbors
layer_neighbors(DT, idcol, splitBy = splitBy)

# and tidy output, prep for merge
outcols <- c('neigh', 'splitNeigh', idcol, 'cutJDate', splitBy, 'Year')
usub <- unique(DT[, .SD, .SDcols = outcols])

# Merge eigcent+correlations with neighbors
wstren <- usub[stren, on = c(idcol, splitBy)]

# Merge edge overlap
out <- wstren[eovr, on = 'layer']


# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/03-temporal-layers.Rds')