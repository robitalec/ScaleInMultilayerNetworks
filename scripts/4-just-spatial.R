### Scale in multilayer networks - sensitivity of thresholds JUST SPATIAL
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'ggplot2',
					'spatsoc',
					'rgdal',
					'asnipe',
					'igraph')
p <- lapply(pkgs, library, character.only = TRUE)


### Data ----
DT <- fread('input/FogoCaribou.csv')


### Date and time columns ----
DT[, c('idate', 'itime') := .(as.IDate(idate), as.ITime(itime))]

## Seasons - Winter: 1-75, Summer: 215-290
DT[between(JDate, 1, 75), season := 'winter']
DT[between(JDate, 215, 290), season := 'summer']

splitBy <- 'season'

### Sub data ----
idcol <- 'ANIMAL_ID'

# dropid <- c('FO2016011', 'FO2017001', 'FO2017013', 'FO2016006')
# & !(ANIMAL_ID %in% dropid)
sub <- DT[Year == 2018  & !is.na(season)]

keepids <- sub[, .N, .(ANIMAL_ID, season)][, .N, ANIMAL_ID][N == 2, ANIMAL_ID]
sub <- sub[ANIMAL_ID %chin% keepids]

### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]

### Spatiotemporal grouping with spatsoc ----
# list spatial thresholds
# spatThresholds <- seq(20, 2000, by = 20)
spatThresholds <- seq(20, 200000, by = 200)

thresholds <- data.table(spat = spatThresholds)

lapply(seq_len(nrow(thresholds)), function(i) {
	group_times(
		sub,
		datetime =  c('idate', 'itime'),
		threshold = '10 minutes'
	)
	group_pts(
		sub,
		threshold = thresholds[i, spat],
		id = idcol,
		coords = projCols,
		timegroup = 'timegroup',
		splitBy = splitBy
	)
	setnames(sub, 'group',
					 paste0('group_', gsub(' ', '_', paste0(thresholds[i], collapse = '_'))))
})



### Group by individual matrices + networks ----
groupcols <- colnames(sub)[grepl('^group', colnames(sub))]
seasons <- sub[, unique(season)]
bys <- CJ(groupcols, seasons)

gbiLs <- lapply(seq_len(nrow(bys)), function(i) {
	gbi <- get_gbi(
		DT = sub[season == bys[i, seasons]],
		group = bys[i, groupcols],
		id = idcol
	)
})

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
names(gLs) <- bys[, paste(groupcols, seasons)]



### Calculate across networks ----
ml <- rbindlist(lapply(gLs, function(g) {
	s <- strength(g)
	list(ANIMAL_ID = names(s), strg = s, deg = degree(g))
}), idcol = 'nms')

ml[, c('group', 'season') := tstrsplit(nms, ' ', type.convert = TRUE)]

ml[, spatscale := tstrsplit(group, '_', keep = 2, type.convert = TRUE)]

cst <- dcast(ml[spatscale <= 500], ANIMAL_ID + season ~ spatscale,
						 value.var = 'strg')

cst <- dcast(ml, ANIMAL_ID + season ~ spatscale,
						 value.var = 'strg')


### Model ----
# What's variation in scales
varcst <- melt(
	cst[, lapply(.SD, var),
			by = season,
			.SDcols = patterns('[0-9]')],
	id.vars = 'season',
	variable.name = 'spatialscale',
	value.name = 'variance',
	variable.factor = FALSE
)
varcst[, spatialscale := as.integer(spatialscale)]


# TODO: Model, how to nest?

### Plots ----
ggplot(varcst) +
	geom_line(aes(spatialscale, variance)) +
	facet_wrap(~season, scales = 'free') +
	labs(x = 'Spatial Scale', y = 'Variance')

ggplot(ml) +
	geom_line(aes(spatscale, strg, color = get(idcol))) +
	guides(color = FALSE) +
	facet_wrap(~season, scales = 'free') +
	labs(x = 'Spatial Scale', y = 'Graph Strength')

ggplot(ml[spatscale <= 5000]) +
	geom_line(aes(spatscale, deg, color = get(idcol))) +
	guides(color = FALSE) +
	facet_wrap(~season, scales = 'free') +
	labs(x = 'Spatial Scale', y = 'Degree')

### checks

sub[, range(group)]
sub[, .N, group][order(N)]
sub[, .N, landcov]
sub[, .N, group][, hist(N)]
ggplot(sub) +
	geom_point(aes(X_COORD, Y_COORD, color = ANIMAL_ID))
