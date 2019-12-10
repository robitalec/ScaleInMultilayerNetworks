### Scale in multilayer networks - sensitivity of thresholds
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

### Spatiotemporal grouping with spatsoc ----
# list temporal thresholds
tempThresholds <- paste(c(10, 30, 60), 'minutes')

# list spatial thresholds
spatThresholds <- c(20, 60, 180)

thresholds <- data.table(expand.grid(tempThresholds, spatThresholds,
																		 stringsAsFactors = FALSE))
setnames(thresholds, c('temp', 'spat'))

lapply(seq_len(nrow(thresholds)), function(i) {
	group_times(
			sub,
			datetime =  c('idate', 'itime'),
			threshold = thresholds[i, temp]
	)
	group_pts(
			sub,
			threshold = thresholds[i, spat],
			id = idcol,
			coords = projCols,
			timegroup = 'timegroup'
	)
	setnames(sub, 'group',
					 paste0('group_', gsub(' ', '_', paste0(thresholds[i], collapse = '_'))))
})



### Group by individual matrices + networks ----
groupcols <- colnames(sub)[grepl('^group', colnames(sub))]
gbiLs <- lapply(groupcols, function(groupcol) {
	gbi <- get_gbi(
		DT = sub,
		group = groupcol,
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
names(gLs) <- groupcols



### Calculate multidegree and strength across networks ----
ml <- rbindlist(lapply(gLs, function(g) {
	s <- strength(g)
	list(ANIMAL_ID = names(s), strg = s)
}), idcol = 'group')

ml[, tempscale := tstrsplit(group, '_', keep = 2, type.convert = TRUE)]
ml[, spatscale := tstrsplit(group, '_', keep = 4, type.convert = TRUE)]

dcast(ml[tempscale == tempscale[[1]]], ANIMAL_ID ~ spatscale, value.var = 'strg')


### Plots ----
ggplot(ml) +
	geom_line(aes(tempscale, strg, group = get(idcol))) +
	facet_grid(~spatscale)

ggplot(ml[tempscale == tempscale[[1]]]) +
	geom_line(aes(spatscale, strg, color = get(idcol))) +
	facet_grid(~tempscale) +
	guides(color = FALSE)


### checks

sub[, range(group)]
sub[, .N, group][order(N)]
sub[, .N, landcov]
sub[, .N, group][, hist(N)]
ggplot(sub) +
	geom_point(aes(X_COORD, Y_COORD, color = ANIMAL_ID))
