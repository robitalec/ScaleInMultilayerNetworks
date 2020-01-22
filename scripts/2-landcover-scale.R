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

lc <- raster('data/Landcover/FogoSDSS_RS.tif')

water <- readOGR('data/Landcover/FogoPoly.shp')


### Reclassify raster ----
mlc <- mask(lc, water)

open <- c(1, 6, 7, 9)
forest <- c(2, 3, 4, 5)
lichen <- 8

rcl <- matrix(c(
	open,
	forest,
	lichen,
	rep(1, length(open)),
	rep(2, length(forest)),
	rep(3, length(lichen))
),
ncol = 2)
rclnms <- list(open = 1, forest = 2, lichen = 3)

reclass <- reclassify(mlc, rcl)

lsres <- c(0, 100, 250)#, 500, 1000)
lslc <- lapply(lsres, function(res) {
  if (res == 0) {
    reclass
  } else {
    winmove(reclass, res, type = 'circle', win_fun = modal)  
  }
  
})

### Sample landcover ----
DT[, (paste0('lc', lsres)) := 
      lapply(lslc, function(lc) extract(lc, matrix(c(EASTING, NORTHING), ncol = 2)))]

rescols <- paste0('lc', lsres)


### Temporal grouping with spatsoc ----
tempthresh <- '5 minutes'

group_times(
  DT,
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)


### Generate networks for each landcover resolution ----
graphs <- lapply(lsres, function(res) {
  # Spatial grouping with spatsoc
  group_pts(
    DT,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = paste0('lc', res)
  )
  
  # usplit <- unique(na.omit(DT, cols = rescol)[[rescol]])
  # 
  # # GBI for each lc
  # gbiLs <- lapply(usplit, function(u) {
  #   gbi <- get_gbi(
  #     DT = DT[get(rescol) == u],
  #     group = 'group',
  #     id = idcol
  #   )
  # })
  # 
  # # Generate networks for each lc
  # netLs <- lapply(
  #   gbiLs,
  #   get_network,
  #   data_format = 'GBI',
  #   association_index = 'SRI'
  # )
  # 
  # gLs <- lapply(
  #   netLs,
  #   graph.adjacency,
  #   mode = 'undirected',
  #   diag = FALSE,
  #   weighted = TRUE
  # )
  # names(gLs) <- paste(rescol, usplit, sep = '-')
  
  neigh(DT, idcol, splitBy)
  
  out <- unique(DT[, .SD, 
                     .SDcols = c('neighborhood', 'splitNeighborhood', idcol, splitBy)])
  set(out, j = 'lcres', value = res)
})

out <- rbindlist(nets)


### Multilayer network metrics ----
var <- 'lcres'

# Redundancy
redundancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(out, 'splitNeighborhood', idcol, var)

# Degree deviation
degdeviation(out, 'splitNeighborhood', idcol, var)

# Relevance
relevance(out, idcol, splitBy = c(var, splitBy))
stopifnot(out[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation


### Output ----
saveRDS(out, 'data/derived-data/2-landcover-scale.Rds')
