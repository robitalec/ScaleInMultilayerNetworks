# === Number of observations ----------------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'spatsoc',
          'asnipe',
          'igraph',
          'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/01-sub-fogo-caribou.Rds')
alloc.col(DT)


# Input -------------------------------------------------------------------
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)


# Generate networks for each n observations -------------------------------
maxn <- 500
nstep <- 2#25

# Randomly select n max observations
randobs <- DT[, sample(unique(timegroup), size = maxn), lc]

var <- 'nobs'
splitBy <- 'lc'

nets <- lapply(seq(10, maxn, by = nstep), function(n) {
  # Select first n random timegroups, 
  #  adding new observations to the tail with each iteration
  sub <- na.omit(DT, cols = splitBy)[timegroup %in% randobs[, .SD[1:n]]$V1]

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
  
  # Generate edge lists
  eLs <- list_edges(gLs)
  
  # Calculate edge overlap
  eovr <- edge_overlap(eLs)
  eovr[, edgeoverlapmat := list(edge_overlap_mat(eLs))][, lc := as.integer(layer)]
  
  # Calculate eigenvector centrality for each season
  stren <- layer_strength(gLs)
  stren[, lc := as.integer(layer)]
  # stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
  setnames(stren, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = splitBy)
  
  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', idcol, splitBy)
  usub <- unique(sub[, .SD, .SDcols = outcols])
  
  # Merge eigcent+correlations with neighbors
  wstren <- usub[stren, on = c(idcol, splitBy)]
  
  # Merge edge overlap
  out <- wstren[eovr, on = splitBy]
  
  # Preserve window length
  set(out, j = var, value = n)
})

out <- rbindlist(nets)


# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/5-number-of-observations.Rds')