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

### Temporal grouping with spatsoc ----
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = '10 minutes'
)

### Generate networks for each spatial threshold ----
# list spatial thresholds
thresholds <- c(5, seq(50, 500, by = 50))

var <- 'spatialthreshold'


nets <- lapply(thresholds, function(t) {
  col <- splitBy
  
  # No sub for spatial threshold
  sub <- DT
  
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
  names(gLs) <- paste0(t, '-', usplit)
  
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

out <- rbindlist(nets)


### Output ----
saveRDS(out, 'data/derived-data/3-spatial-threshold.Rds')