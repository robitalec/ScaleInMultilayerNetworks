### Scale in multilayer networks - time window position
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
DT <- readRDS('data/derived-data/1-sub-fogo-caribou.Rds')
alloc.col(DT)


### Variable time window position ----
# Remove season column from 1-prep
DT[, season := NULL]

l <- lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  
  DT[between(JDate, winterlow + pos, winterlow + pos + winlength), (col) := 'winter']
  DT[between(JDate, summerlow + pos, summerlow + pos + winlength), (col) := 'summer']
  
  # Fake output
  pos
})


### Temporal grouping ----
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)

### Generate networks for each n observations ----
var <- 'winpos'

nets <- lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  splitBy <- c(lccol, col)
  
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
  set(out, j = var, value = pos)
})
# TODO: not always a consistent n individuals because some IDs NA in an LC
out <- rbindlist(nets)

### Output ----
saveRDS(out, 'data/derived-data/6-time-window-position.Rds')
