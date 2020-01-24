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
var <- 'winlength'

# TODO: rm [1:2]
# TODO: there shouldnt be 22 vs 17... 
nets <- lapply(winlengths[1:200], function(len) {
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
  names(gLs) <- paste0(len, '-', usplit)
  
  # Calculate eigenvector centrality for each season
  eig <- layer_eigen(gLs)
  
  # Calculate correlation of season layers
  set(eig, j = 'layercorr', value = layer_correlation(gLs))
  eig[, c(var, splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
  setnames(eig, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = col)

  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', idcol, col)
  out <- unique(sub[, .SD, .SDcols = outcols])
  setnames(out, col, splitBy)
  
  # Merge eigcent+correlations with neighbors
  out[eig, on = c(idcol, splitBy)]
})


### Multilayer network metrics ----
# TODO: fix new data 'found duplicate id in a timegroup and/or splitBy - does your group_times threshold match the fix rate?'

out <- rbindlist(nets)

# Redundancy
connective_redudancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multi_degree(out, 'splitNeigh', idcol, var)

# Degree deviation
deviation_degree(out, 'splitNeigh', idcol, var)

# Relevance
layer_relevance(out, idcol, var, splitBy = splitBy)
stopifnot(out[!between(relev, 0, 1), .N] == 0)

### Output ----
saveRDS(out, 'data/derived-data/4-time-window-length.Rds')
