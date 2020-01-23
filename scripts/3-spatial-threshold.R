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
alloc.col(DT)

### Spatiotemporal grouping with spatsoc ----
# list spatial thresholds
thresholds <- c(5, seq(50, 500, by = 50))

group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = '10 minutes'
)

nets <- lapply(thresholds, function(t) {

	neigh(DT, idcol, splitBy)
	
	out <- unique(DT[, .SD, 
	                 .SDcols = c('neighborhood', 'splitNeighborhood', idcol, splitBy)])
	set(out, j = 'spatialthreshold', value = t)
})

nets <- lapply(thresholds, function(t) {
  group_pts(
    DT,
    threshold = t,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup'
  )
  
  usplit <- unique(na.omit(sub, cols = col)[[col]])
  
  # GBI for each season
  gbiLs <- lapply(usplit, function(u) {
    gbi <- get_gbi(
      DT = sub[get(col) == u],
      group = 'group',
      id = idcol
    )
  })
  
  # Generate networks for each season
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
  names(gLs) <- paste0(col, '-', usplit)
  
  eig <- rbindlist(
    lapply(lapply(gLs, function(g) eigen_centrality(g)$vector), stack),
    idcol = 'lenseason')
  eig[, c('winlength', 'season') := tstrsplit(lenseason, '-')]
  eig[, winlength := as.integer(gsub('season', '', winlength))]
  setnames(eig, c('ind', 'values'), c(idcol, 'eigcent'))
  
  # TODO: modify neigh so it's working on a by
  # TODO: remove it from this lapply and merge afterwards
  # TODO: just return eig centrality and network correlation etc
  # TODO: then merge onto neigh output from above
  neigh(sub, idcol, col)
  
  outcols <- c('neighborhood', 'splitNeighborhood', idcol, col)
  out <- unique(sub[, .SD, .SDcols = outcols])
  setnames(out, col, 'season')
  set(out, j = 'winlength', value = len)
  
  out <- unique(DT[, .SD, 
                   .SDcols = c('neighborhood', 'splitNeighborhood', idcol, splitBy)])
  set(out, j = 'spatialthreshold', value = t)
  
  out[eig, on = c(idcol, 'season', 'winlength')]
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