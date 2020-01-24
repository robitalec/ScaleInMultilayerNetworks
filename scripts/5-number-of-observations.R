### Scale in multilayer networks - number of observations
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
          'ggplot2',
          'spatsoc',
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
  threshold = tempthresh
)

### Generate networks for each n observations ----
maxn <- 750 #sub[, uniqueN(timegroup)]
nstep <- 25

# Randomly select n max observations
randobs <- DT[, sample(unique(timegroup), size = maxn), season]

var <- 'nobs'

nets <- lapply(seq(10, maxn, by = nstep), function(n) {
  col <- splitBy
  
  # Select first n random timegroups, 
  #  adding new observations to the tail with each iteration
  sub <- DT[timegroup %in% randobs[, .SD[1:n], season]$V1]

  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = splitBy
  )
  
  usplit <- unique(na.omit(sub, cols = col)[[col]])
  
  # GBI for each season
  gbiLs <- list_gbi(sub, idcol, usplit, col)
  
  # Generate networks for each season
  netLs <- list_nets(gbiLs)
  
  # Generate graphs for each season
  gLs <- list_graphs(netLs)
  names(gLs) <- paste0(n, '-', usplit)
  
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

# TODO: check "found duplicate id in a timegroup and/or splitBy - does your group_times threshold match the fix rate?"
out <- rbindlist(nets)


### Output ----
saveRDS(out, 'data/derived-data/5-number-of-observations.Rds')
