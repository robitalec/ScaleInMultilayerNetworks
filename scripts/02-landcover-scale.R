# === Land Cover Scale ----------------------------------------------------
# Alec Robitaille

# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
					'spatsoc',
					'rgdal',
					'asnipe',
					'raster',
					'igraph',
					'grainchanger',
					'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')

# Input -------------------------------------------------------------------
# TODO: switch back to sub seasons?
DT <- readRDS('data/derived-data/1-all-fogo-caribou.Rds')
alloc.col(DT)

lc <- readRDS('data/derived-data/1-reclass-lc.Rds')


# If already run
# lslc <- lapply(dir('data/derived-data', '2-landcover-res-*', full.names = TRUE),
#                raster)
# lsres <- c(30, 100, 250, 500, 750, 1000)
# names(lslc) <- lsres

# Modal window ------------------------------------------------------------
lsres <- c(100, 250, 500, 750, 1000)
lslc <- lapply(lsres, function(res) {
  winmove(lc, res, type = 'circle', win_fun = modal)
})
names(lslc) <- lsres


# Sample land cover -------------------------------------------------------
DT[, (paste0('lc', lsres)) :=
      lapply(lslc, function(l) extract(l, matrix(c(EASTING, NORTHING), ncol = 2)))]


# Temporal grouping with spatsoc ------------------------------------------
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)



# Generate networks for each land cover resolution ------------------------
var <- 'lcres'

# Also include original raster
lsres <- c(30, lsres)
lslc <- c(lc, lslc)
# TODO: switch back to seasons?
splitBy <- c()

nets <- lapply(lsres, function(res) {
  col <- ifelse(res == 30, 'lc', paste0('lc', res))
  splitBy <- c(splitBy, col)
  
  sub <- na.omit(DT, cols = splitBy)
  
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = spatthresh,
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
  names(gLs) <- names(gbiLs)
  
  # Generate edge lists
  eLs <- list_edges(gLs)
  
  # Calculate edge overlap
  eovr <- edge_overlap(eLs)
  eovr[, edgeoverlapmat := list(edge_overlap_mat(eLs))]
  
  # Calculate eigenvector centrality for each season
  stren <- layer_strength(gLs)
  stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
  setnames(stren, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = splitBy)
  
  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', idcol, splitBy)
  usub <- unique(sub[, .SD, .SDcols = outcols])
  
  # Merge eigcent+correlations with neighbors
  wstren <- usub[stren, on = c(idcol, splitBy)]
  setnames(wstren, col, gsub('[0-9]', '', col))
  
  # Merge edge overlap
  out <- wstren[eovr, on = 'layer']
  
  # Preserve land cover resolution
  set(out, j = var, value = res)
})

out <- rbindlist(nets)



# Count locs in lc --------------------------------------------------------
count <- rbindlist(lapply(grep('lc[0-9]', colnames(DT), value = TRUE), function(col) {
  DT[, .N, col][, 
    c('lc', 'res') := .(get(col), as.integer(gsub('lc', '', col)))][, 
      .(lc, res, N)]
}))




# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/2-landcover-scale.Rds')
saveRDS(count, 'data/derived-data/2-landcover-scale-count.Rds')

lapply(seq_along(lslc), function(r) writeRaster(lslc[[r]], paste0('data/derived-data/2-landcover-res-', names(lslc)[[r]], '.tif')))