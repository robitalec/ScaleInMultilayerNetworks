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
if(interactive()) {
  source('scripts/00-variables.R')
}


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/01-sub-fogo-caribou.Rds')
alloc.col(DT)

lc <- readRDS('data/derived-data/01-reclass-lc.Rds')


# Modal window ------------------------------------------------------------
# If already run
lslc <- lapply(dir('data/derived-data', '2-landcover-res-*', full.names = TRUE),
               raster)
lsres <- as.integer(gsub(".tif", "", unlist(tstrsplit(
  dir('data/derived-data', '2-landcover-res-*', full.names = TRUE),
  'res-',
  keep = 2
))))
names(lslc) <- lsres

# lsres <- seq(100, 1000, by = 100)
# lslc <- lapply(lsres, function(res) {
#   w <- winmove(lc, res, type = 'circle', win_fun = modal)
#   w[is.na(lc)] <- NA
#   w
# })
# names(lslc) <- lsres


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
count <- rbindlist(lapply(grep('lc|lc[0-9]', colnames(DT), value = TRUE), function(col) {
  DT[, .N, col][, 
    c('lc', 'res') := .(get(col), as.integer(gsub('lc', '', col)))][, 
      .(lc, res, N)]
}))
count[is.na(res), res := 30]



# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/02-landcover-scale.Rds')
saveRDS(count, 'data/derived-data/02-landcover-scale-count.Rds')

# lapply(seq_along(lslc), function(r) writeRaster(lslc[[r]], paste0('data/derived-data/02-landcover-res-', names(lslc)[[r]], '.tif'), overwrite = TRUE))
