### Scale in multilayer networks - spatial threshold
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
DT <- fread('data/FogoCaribou.csv')

### Sub data ----
sub <- DT[Year == 2018]

idcol <- 'ANIMAL_ID'

### Cast columns ----
sub[, idate := as.IDate(idate)]
sub[, itime := as.ITime(itime)]

### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]

### Spatiotemporal grouping with spatsoc ----
# list spatial thresholds
thresholds <- seq(10, 500, by = 10)

lapply(thresholds, function(t) {
	group_times(
			sub,
			datetime =  c('idate', 'itime'),
			threshold = '10 minutes'
	)
	group_pts(
			sub,
			threshold = t,
			id = idcol,
			coords = projCols,
			timegroup = 'timegroup'
	)
	setnames(sub, 'group', paste0('group_', t))
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
