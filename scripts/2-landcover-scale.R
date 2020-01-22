### Scale in multilayer networks - landcover scale
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'ggplot2',
					'spatsoc',
					'rgdal',
					'asnipe',
					'raster',
					'igraph',
					'grainchanger')
p <- lapply(pkgs, library, character.only = TRUE)


### Data ----
DT <- readRDS('data/derived-data/sub-seasons-fogo-caribou.Rds')

lc <- raster('data/Landcover/FogoSDSS_RS.tif')

water <- readOGR('data/Landcover/FogoPoly.shp')


### Variables ----
source('scripts/0-variables.R')

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
    splitBy = rescol
  )
  
  usplit <- unique(na.omit(DT, cols = rescol)[[rescol]])
  
  # GBI for each lc
  gbiLs <- lapply(usplit, function(u) {
    gbi <- get_gbi(
      DT = DT[get(rescol) == u],
      group = 'group',
      id = idcol
    )
  })
  
  # Generate networks for each lc
  netLs <- lapply(
    gbiLs,
    get_network,
    data_format = 'GBI',
    association_index = 'SRI'
  )
  
  gLs <- lapply(
    netLs,
    graph.adjacency,
    mode = 'undirected',
    diag = FALSE,
    weighted = TRUE
  )
  names(gLs) <- paste(rescol, usplit, sep = '-')
  
  neigh(DT, idcol, splitBy)
  
  out <- unique(DT[, .SD, 
                     .SDcols = c('neighborhood', 'splitNeighborhood', idcol, splitBy)])
  set(out, j = 'rescol', value = rescol)
})

out <- rbindlist(nets)


### Multilayer network metrics ----
out[, lcres := tstrsplit()]
var <- 'lc'
# Redundancy
redundancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(out, 'splitNeighborhood', idcol, 'nobs')

# Degree deviation
degdeviation(out, 'splitNeighborhood', idcol, 'nobs')

# Relevance
relevance(out, idcol, splitBy = c('nobs', splitBy))
stopifnot(out[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation

### Plots ----
## Plots that combine seasons
g <- ggplot(DT, aes(x = nobs,
                    color = get(idcol),
                    group = get(idcol))) + 
  guides(color = FALSE)

# Number of observations vs multidegree
g1 <- g + geom_line(aes(y = multideg))

# Number of observations vs degree deviation
g2 <- g + geom_line(aes(y = degdev))

# Number of observations vs neighborhood (combined layers)
g3 <- g + geom_line(aes(y = neighborhood))

## Plots that separate seasons
g <- g +
  facet_wrap(~season) +
  guides(color = FALSE)

# Number of observations vs split neighborhood (by layer) 
g4 <- g + geom_line(aes(y = splitNeighborhood))

# Number of observations vs layer relevance
g5 <- g + geom_line(aes(y = relev))


library(patchwork)

# TODO: problem is none of these are weighted, they are all integer, so not varying after all individuals
# TODO: think about cutting these off where they settle and including extended versions in supplemental
g1 / 
  g2 / 
  # g3 / 
  g4 / 
  g5 

