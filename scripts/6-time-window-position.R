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
DT <- readRDS('data/derived-data/sub-fogo-caribou.Rds')
alloc.col(DT)


### Variable time window position ----
# Remove season column from 1-prep
DT[, season := NULL]

l <- lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  
  DT[between(JDate, 1 + pos, 1 + pos + winlength), (col) := 'winter']
  DT[between(JDate, 215 + pos, 215 + pos + winlength), (col) := 'summer']
  
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

# TODO: switch to season*lc

nets <- lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  
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
  print(sub[, unique(ANIMAL_ID)])
  usplit <- unique(na.omit(sub, cols = col)[[col]])
  
  # GBI for each season
  gbiLs <- list_gbi(sub, idcol, usplit, col)
  
  # Generate networks for each season
  netLs <- list_nets(gbiLs)
  
  # Generate graphs for each season
  gLs <- list_graphs(netLs)
  names(gLs) <- paste0(pos, '-', usplit)
  
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
# TODO: check why different number of individuals as seasons move
# TODO: difference in degree? between seasons
# TODO: why multiple for same individual
# TODO: careful if inconsistent number of individuals

out <- rbindlist(nets)

### Output ----
saveRDS(out, 'data/derived-data/6-time-window-position.Rds')
