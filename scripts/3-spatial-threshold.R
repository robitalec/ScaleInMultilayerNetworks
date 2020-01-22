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


### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- readRDS('data/derived-data/sub-seasons-fogo-caribou.Rds')


### Spatiotemporal grouping with spatsoc ----
# list spatial thresholds
thresholds <- c(5, seq(50, 500, by = 50))

group_times(
  DT,
  datetime =  c('idate', 'itime'),
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

### Plots ----
## Plots that combine seasons
g <- ggplot(DT, aes(x = lcres,
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


## ARCHIVE
dcast(ml, ANIMAL_ID ~ spatscale, value.var = 'cent')

# Network correlations
netcors <- data.table(
  cornet = vapply(seq_along(netLs)[-length(netLs)], function(i) {
  cor(c(netLs[[i]]), c(netLs[[i + 1]]))
}, FUN.VALUE = 42.0),
spatscale = unique(ml$spatscale)[-length(netLs)])