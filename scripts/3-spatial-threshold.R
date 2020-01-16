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
thresholds <- c(5, seq(50, 500, by = 50))

group_times(
  sub,
  datetime =  c('idate', 'itime'),
  threshold = '10 minutes'
)

# TODO: why duplicate ids.. check new data
# TODO: drop this 
sub <- sub[!(timegroup %in% sub[, .N, .(ANIMAL_ID, timegroup)][N > 1, unique(timegroup)])]

lapply(thresholds, function(t) {
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



### Calculate degree, centrality across networks ----
ml <- rbindlist(lapply(gLs, function(g) {
	deg <- degree(g)
  cent <- centr_eigen(g, directed = FALSE)
	list(ANIMAL_ID = names(deg), deg = deg, cent = cent$vector)
}), idcol = 'group')

# TODO: rm this
# ml <- unique(ml)

ml[, spatscale := tstrsplit(group, '_', keep = 2, type.convert = TRUE)]

dcast(ml, ANIMAL_ID ~ spatscale, value.var = 'cent')


### Plots ----
ggplot(ml) +
  geom_line(aes(spatscale, deg, color = get(idcol))) +
  guides(color = FALSE)

ggplot(ml) +
  geom_line(aes(spatscale, cent, color = get(idcol))) +
  guides(color = FALSE)

