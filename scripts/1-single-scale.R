### Scale in multilayer networks - landcover networks
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
DT <- fread('input/FogoCaribou.csv')

lc <- raster('input/Landcover/FogoSDSS_RS.tif')


### Reclassify raster ----
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

reclass <- reclassify(lc, rcl)

### Sub data ----
idcol <- 'ANIMAL_ID'

dropid <- c('FO2016011', 'FO2017001', 'FO2017013', 'FO2016006')
sub <- DT[Year == 2018 & JDate < 75][!(ANIMAL_ID %in% dropid)]
sub[, c('idate', 'itime') := .(as.IDate(idate), as.ITime(itime))]


### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]

### Sample landcover ----
# landcover
sub[, landcov := extract(lc,
												 matrix(c(EASTING, NORTHING),
												 			 ncol = 2))]

sub[, relc := extract(reclass,
												 matrix(c(EASTING, NORTHING),
												 			 ncol = 2))]

splitBy <- 'relc'


### Spatiotemporal grouping with spatsoc ----
group_times(
	sub,
	datetime =  c('idate', 'itime'),
	threshold = '10 minutes'
)

group_pts(
	sub,
	threshold = 50,
	id = idcol,
	coords = projCols,
	timegroup = 'timegroup',
	splitBy = splitBy
)

### Group by individual matrices + networks ----
# gbi <- get_gbi(
# 	DT = sub,
# 	group = 'group',
# 	id = idcol
# )

ulc <- sub[!is.na(get(splitBy)), unique(get(splitBy))]
gbiLs <- lapply(ulc, function(l) {
	get_gbi(
		DT = sub[get(splitBy) == l],
		group = 'group',
		id = idcol
	)
})

# net <- get_network(
# 	gbi,
# 	data_format = 'GBI',
# 	association_index = 'SRI'
# )

## All individuals are in each network
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
names(gLs) <- ulc



### Calculate multidegree and strength across networks ----
ml <- rbindlist(lapply(gLs, function(g) {
	d <- degree(g)
	s <- strength(g)
	list(deg = d, ANIMAL_ID = names(d), strg = s)
}), idcol = splitBy)


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


### checks

sub[, range(group)]
sub[, .N, group][order(N)]
sub[, .N, landcov]
sub[, .N, group][, hist(N)]
ggplot(sub) +
	geom_point(aes(X_COORD, Y_COORD, color = ANIMAL_ID))
