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
nchunk <- 25

# TODO: check consistent N by cut * year
setorder(DT, Year, JDate)
DT[, dayoffull := .GRP, .(JDate, Year)]

DT[, cutJDate := cut(dayoffull, nchunk, include.lowest = TRUE)]
DT[, timecut := .GRP, cutJDate]

DT[, date := as.IDate(datetime)]
DT[, mindate := min(date), by = timecut]
DT[, maxdate := max(date), by = timecut]

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
outcols <- c('neigh', 'splitNeigh', idcol, 'cutJDate', 
             splitBy, 'mindate', 'maxdate')
usub <- unique(DT[, .SD, .SDcols = outcols])

# Merge eigcent+correlations with neighbors
wstren <- usub[stren, on = c(idcol, splitBy)]

# Merge edge overlap
wedgeovr <- wstren[eovr, on = 'layer']

# Property matrix
matrices <- property_matrix(wedgeovr, idcol, 'splitNeigh', var)
layer_similarity_ordinal(matrices, 'FO', var)

out <- wedgeovr[matrices, on = 'layer']

# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/03-temporal-layers.Rds')
