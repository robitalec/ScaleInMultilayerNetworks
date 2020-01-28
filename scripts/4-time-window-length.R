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
DT <- readRDS('data/derived-data/1-sub-fogo-caribou.Rds')
alloc.col(DT)

### Variable time window length ----
# Remove season column from 1-data-prep.R
DT[, season := NULL]

l <- lapply(winlengths, function(l) {
  col <- paste0('season', l)
  
  DT[between(JDate, winterlow, winterlow + l), (col) := 'winter']
  DT[between(JDate, summerlow, summerlow + l), (col) := 'summer']
  
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

nets <- lapply(winlengths[1:2], function(len) {
  col <- paste0('season', len)
  splitBy <- c(col, lccol)
  
  sub <- na.omit(DT, cols = splitBy)
  
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = splitBy
  )
  
  
  # GBI for each season
  gbiLs <- list_gbi(sub, idcol, splitBy)

  # Generate networks for each season
  netLs <- list_nets(gbiLs)
  
  # Generate graphs for each season
  gLs <- list_graphs(netLs)
  names(gLs) <- names(gbiLs)
  
  # Calculate eigenvector centrality for each season
  stren <- layer_strength(gLs)
  stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
  setnames(stren, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = splitBy)

  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', idcol, splitBy)
  out <- unique(sub[, .SD, .SDcols = outcols])
  
  # Merge eigcent+correlations with neighbors
  out <- out[stren, on = c(idcol, splitBy)]
  setnames(out, col, gsub('[0-9]', '', col))
  
  # Preserve window length
  set(out, j = var, value = len)
})

out <- rbindlist(nets)


### Output ----
saveRDS(out, 'data/derived-data/4-time-window-length.Rds')
