### Scale in multilayer networks - time window length
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'ggplot2',
					'spatsoc',
					'rgdal',
					'asnipe',
					'igraph',
					'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- readRDS('data/derived-data/sub-2018-fogo-caribou.Rds')
alloc.col(DT)

### Variable time window length ----
# Remove season column from 1-data-prep.R
DT[, season := NULL]

# TODO: should this be a smaller min window size?
winlengths <- seq(75, 150, 5)
  
l <- lapply(winlengths, function(l) {
  col <- paste0('season', l)
  
  DT[between(JDate, 1, 1 + l), (col) := 'winter']
  DT[between(JDate, 215, 215 + l), (col) := 'summer']
  
  # Fake output
  l
})


### Temporal grouping ----
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)

### Generate networks for each n observations ----
# TODO: rm [1:2]
# TODO: there shouldnt be 22 vs 17... 
graphLs <- lapply(winlengths[1:2], function(len) {
  col <- paste0('season', len)
  
  sub <- DT[!is.na(get(col))]
  
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = col
  )
  
  usplit <- unique(na.omit(sub, cols = col)[[col]])

  # GBI for each season
  gbiLs <- list_gbi(sub, idcol, usplit, col)

  # Generate networks for each season
  netLs <- list_nets(gbiLs)
  
  # Generate graphs for each season
  gLs <- list_graphs(netLs)
  names(gLs) <- paste0(col, '-', usplit)
  gLs
  
})


### Multilayer network metrics ----
var <- 'winlength'

gLs <- unlist(graphLs, recursive = FALSE)
eig <- layer_eigen(gLs, idcol)

eig[, c(var, 'season') := tstrsplit(lenseason, '-')]


# eig <- rbindlist(
#   lapply(lapply(gLs, function(g) eigen_centrality(g)$vector), stack),
#   idcol = 'lenseason')
# eig[, c('winlength', 'season') := tstrsplit(lenseason, '-')]
# eig[, winlength := as.integer(gsub('season', '', winlength))]
# setnames(eig, c('ind', 'values'), c(idcol, 'eigcent'))

# TODO: modify neigh so it's working on a by
# TODO: remove it from this lapply and merge afterwards
# TODO: just return eig centrality and network correlation etc
# TODO: then merge onto neigh output from above
# neigh(sub, idcol, col)
# 
# outcols <- c('neighborhood', 'splitNeighborhood', idcol, col)
# out <- unique(sub[, .SD, .SDcols = outcols])
# setnames(out, col, 'season')
# set(out, j = 'winlength', value = len)
# 
# out[eig, on = c(idcol, 'season', 'winlength')]

# TODO: fix new data 'found duplicate id in a timegroup and/or splitBy - does your group_times threshold match the fix rate?'
nnets <- unlist(nets, recursive = FALSE)
layer_eigen(nnets)
layer_
out <- rbindlist(nets)

var <- 'winlength'

# Redundancy
redundancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(out, 'splitNeighborhood', idcol, var)

# Degree deviation
degdeviation(out, 'splitNeighborhood', idcol, var)

# Relevance
relevance(out, idcol, var, splitBy = splitBy)
stopifnot(out[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation

### Output ----
saveRDS(out, 'data/derived-data/4-time-window-length.Rds')
