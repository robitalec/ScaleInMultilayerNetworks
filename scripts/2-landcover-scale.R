### Scale in multilayer networks - landcover scale
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'spatsoc',
					'rgdal',
					'asnipe',
					'raster',
					'igraph',
					'grainchanger')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')

### Data ----
DT <- readRDS('data/derived-data/sub-seasons-fogo-caribou.Rds')

lc <- raster('data/derived-data/1-reclass-lc.Rds')

water <- readOGR('data/Landcover/FogoPoly.shp')


### Reclassify raster ----
lsres <- c(100, 250)#, 500, 1000)
lslc <- lapply(lsres, function(res) {
  winmove(lc, type = 'circle', win_fun = modal)
})

### Sample landcover ----
DT[, (paste0('lc', lsres)) := 
      lapply(lslc, function(lc) extract(lc, matrix(c(EASTING, NORTHING), ncol = 2)))]

### Temporal grouping with spatsoc ----
tempthresh <- '5 minutes'

group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)


### Generate networks for each landcover resolution ----
var <- 'lcres'

# Also include original raster
lsres <- c(30, lsres)
lslc <- c(lc, lslc)

nets <- lapply(lsres, function(res) {
  col <- paste0('lc', res)
  
  # Spatial grouping with spatsoc
  group_pts(
    DT,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = col
  )
  
  usplit <- unique(na.omit(sub, cols = col)[[col]])
  
  # GBI for each season
  gbiLs <- list_gbi(sub, idcol, usplit, col)
  
  # Generate networks for each season
  netLs <- list_nets(gbiLs)
  
  # Generate graphs for each season
  gLs <- list_graphs(netLs)
  names(gLs) <- paste0(res, '-', usplit)
  
  # Calculate eigenvector centrality for each season
  eig <- layer_eigen(gLs)
  
  # Calculate correlation of season layers
  set(eig, j = 'layercorr', value = layer_correlation(gLs))
  eig[, c(var, splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
  setnames(eig, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = col)
  
  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', idcol, col)
  out <- unique(sub[, .SD, .SDcols = outcols])
  setnames(out, col, splitBy)
  
  # Merge eigcent+correlations with neighbors
  out[eig, on = c(idcol, splitBy)]
})

out <- rbindlist(nets)


### Output ----
saveRDS(out, 'data/derived-data/2-landcover-scale.Rds')
