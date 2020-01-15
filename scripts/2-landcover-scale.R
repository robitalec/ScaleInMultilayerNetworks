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
DT <- fread('data/FogoCaribou.csv')

lc <- raster('data/Landcover/FogoSDSS_RS.tif')

water <- readOGR('data/Landcover/FogoPoly.shp')

### Sub data ----
# TODO: add season? 
sub <- DT[Year == 2018]

idcol <- 'ANIMAL_ID'
# keepids <- sub[, .N, c(idcol, 'season')][, .N, idcol][N == 2][[idcol]]
# sub <- sub[get(idcol) %chin% keepids]

### Cast columns ----
sub[, idate := as.IDate(idate)]
sub[, itime := as.ITime(itime)]

### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]


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
# landcover
sub[, landcov := extract(lc, matrix(c(EASTING, NORTHING), ncol = 2))]

sub[, (paste0('lc', lsres)) := 
      lapply(lslc, function(lc) extract(lc, matrix(c(EASTING, NORTHING), ncol = 2)))]

rescols <- colnames(sub)[grepl('lc', colnames(sub))]


### Temporal grouping with spatsoc ----
tempthresh <- '5 minutes'

group_times(
  sub,
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)


### Generate networks for each n observations ----
spatthresh <- 50

graphs <- lapply(rescols, function(rescol) {
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = rescol
  )
  
  usplit <- unique(na.omit(sub, cols = rescol)[[rescol]])
  
  # GBI for each lc
  gbiLs <- lapply(usplit, function(u) {
    gbi <- get_gbi(
      DT = sub[get(rescol) == u],
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
  names(gLs) <- paste0(rescol, '-', usplit)
  gLs
})

### Multilayer network metrics ----
multdeg <- rbindlist(lapply(graphs, function(g) {
  deg <- lapply(g, degree)
  rbindlist(lapply(deg, stack), idcol = 'by')
}))

setnames(multdeg, c('by', 'deg', idcol))

multdeg[, c('res', 'lc') := tstrsplit(by, '-', type.convert = TRUE)]

multdeg[, mdeg := sum(deg), by = c('res', idcol)]

multdeg[, var(deg), by = .(ANIMAL_ID, lc)][order(V1)]

### Plots ----
ggplot(multdeg[ANIMAL_ID == 'FO2016002']) + 
  geom_line(aes(lc, deg, color = res)) +
  facet_wrap(~ANIMAL_ID)
  guides(color = FALSE)

ggplot(multdeg) + 
  geom_line(aes(lc, deg)) +
  facet_grid(res~get(idcol)) +
  guides(color = FALSE)

ggplot(multdeg) + 
  geom_line(aes(res, mdeg, color = get(idcol), group = get(idcol))) +
  facet_wrap(~get(idcol)) +
  guides(color = FALSE)


ggplot(multdeg) + 
  geom_line(aes(nobs, deg, color = get(idcol), group = get(idcol))) +
  facet_wrap(~get(idcol) + season)




### Plots ----
ggplot(ml) +
	geom_histogram(aes(deg)) +
	facet_wrap(~get(splitBy))


ggplot(ml) +
	geom_line(aes(factor(get(splitBy), levels = rclnms, labels = names(rclnms)),
								deg, group = get(idcol), color = get(idcol))) +
	labs(x = 'Landcover', y =  'Degree') +
	guides(color = FALSE)

ggplot(ml) +
	geom_line(aes(factor(get(splitBy), levels = rclnms, labels = names(rclnms)),
								strg, group = get(idcol), color = get(idcol))) +
	labs(x = 'Landcover', y =  'Strength') +
	guides(color = FALSE)