# === Time ----------------------------------------------------------------
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
DT <- readRDS('data/derived-data/1-sub-fogo-caribou.Rds')
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
# TODO: double fixes
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

# Calculate eigenvector centrality
stren <- layer_strength(gLs)
stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
setnames(stren, 'ind', idcol)

# Calculate neighbors
layer_neighbors(DT, idcol, splitBy = splitBy)

# and tidy output, prep for merge
outcols <- c('neigh', 'splitNeigh', idcol, 'cutJDate', splitBy)
out <- unique(DT[, .SD, .SDcols = outcols])

# Merge eigcent+correlations with neighbors
out <- out[stren, on = c(idcol, splitBy)]



# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/4-time.Rds')
