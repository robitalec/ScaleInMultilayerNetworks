### Scale in multilayer networks - spatial threshold
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'spatsoc',
					'rgdal',
					'asnipe',
					'igraph', 
					'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- readRDS('data/derived-data/sub-seasons-fogo-caribou.Rds')


### Spatiotemporal grouping with spatsoc ----
# list spatial thresholds
thresholds <- c(5, seq(50, 500, by = 50))

group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = '10 minutes'
)

# TODO: why duplicate ids.. check new data
# TODO: drop this 
DT <- DT[!(timegroup %in% sub[, .N, .(ANIMAL_ID, timegroup)][N > 1, unique(timegroup)])]

lapply(thresholds, function(t) {
	group_pts(
	  DT,
			threshold = t,
			id = idcol,
			coords = projCols,
			timegroup = 'timegroup'
	)

	neigh(DT, idcol, splitBy)
	
	out <- unique(DT[, .SD, 
	                 .SDcols = c('neighborhood', 'splitNeighborhood', idcol, splitBy)])
	set(out, j = 'spatialthreshold', value = t)
})

out <- rbindlist(nets)


### Multilayer network metrics ----
var <- 'spatialthreshold'

# Redundancy
redundancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(out, 'splitNeighborhood', idcol, var)

# Degree deviation
degdeviation(out, 'splitNeighborhood', idcol, var)

# Relevance
# TODO: fix implementation of var
relevance(out, idcol, splitBy = c(var, splitBy))
stopifnot(out[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation

### Output ----
saveRDS(out, 'data/derived-data/3-spatial-threshold.Rds')



## ARCHIVE
dcast(ml, ANIMAL_ID ~ get(var), value.var = 'cent')

# Network correlations
netcors <- data.table(
  cornet = vapply(seq_along(netLs)[-length(netLs)], function(i) {
  cor(c(netLs[[i]]), c(netLs[[i + 1]]))
}, FUN.VALUE = 42.0),
spatscale = unique(ml$spatscale)[-length(netLs)])