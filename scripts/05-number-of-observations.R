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
maxn <- 1000
nstep <- 50

# Randomly select n max observations
randobs <- DT[!is.na(lc), sample(unique(timegroup), size = maxn), lc]

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
  eLs[, layer := as.integer(layer)]
  
  # Calculate edge overlap
  eovr <- edge_overlap(eLs)
  eovr[, edgeoverlapmat := list(edge_overlap_mat(eLs))]
  
  # Calculate eigenvector centrality for each season
  stren <- layer_strength(gLs)
  stren[, layer := as.integer(layer)]
  setnames(stren, 'ind', idcol)
  
  # Calculate neighbors
  layer_neighbors(sub, idcol, splitBy = splitBy)
  
  # and tidy output, prep for merge
  outcols <- c('neigh', 'splitNeigh', idcol, splitBy)
  usub <- unique(sub[, .SD, .SDcols = outcols])
  usub[, layer := lc]
  
  # Merge eigcent+correlations with neighbors
  wstren <- usub[stren, on = c(idcol, 'layer')]
  
  # Merge edge overlap
  out <- wstren[eovr, on = 'layer']
  
  # Preserve window length
  set(out, j = var, value = n)
})

out <- rbindlist(nets)


# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/05-number-of-observations.Rds')