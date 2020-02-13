### Scale in multilayer networks - landcover scale
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'spatsoc',
					'rgdal',
					'asnipe',
					'raster',
					'igraph',
					'grainchanger',
					'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')

### Data ----
DT <- readRDS('data/derived-data/1-sub-seasons-fogo-caribou.Rds')
alloc.col(DT)

lc <- readRDS('data/derived-data/1-reclass-lc.Rds')


### Modal window ----
lsres <- c(100, 250, 500, 750, 1000)
lslc <- lapply(lsres, function(res) {
  winmove(lc, res, type = 'circle', win_fun = modal)
})
names(lslc) <- lsres


### Sample landcover ----
DT[, (paste0('lc', lsres)) := 
      lapply(lslc, function(lc) extract(lc, matrix(c(EASTING, NORTHING), ncol = 2)))]

### Temporal grouping with spatsoc ----
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
splitBy <- 'season'

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
  
  # Calculate eigenvector centrality for each season
  stren <- layer_strength(gLs)
  stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
  setnames(stren, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = splitBy)
  
  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', idcol, splitBy)
  out <- unique(sub[, .SD, .SDcols = outcols])
  
  # Merge eigcent+correlations with neighbors
  out <- out[stren, on = c(idcol, splitBy)]
  setnames(out, col, gsub('[0-9]', '', col))
  
  # Preserve window length
  set(out, j = var, value = res)
})

out <- rbindlist(nets)


### Output ----
saveRDS(out, 'data/derived-data/2-landcover-scale.Rds')
