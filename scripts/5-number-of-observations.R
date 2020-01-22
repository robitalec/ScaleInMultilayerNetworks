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
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)

### Generate networks for each n observations ----
maxn <- 750 #sub[, uniqueN(timegroup)]
nstep <- 25
# Randomly select n max observations
randobs <- DT[, sample(unique(timegroup), size = maxn), season]

nets <- lapply(seq(10, maxn, by = nstep), function(n) {
  # Select first n random timegroups, 
  #  adding new observations to the tail with each iteration
  nsub <- DT[timegroup %in% randobs[, .SD[1:n], season]$V1]

  # Spatial grouping with spatsoc
  group_pts(
    nsub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = splitBy
  )
  
  # TODO: if dont find a weighted, then this is not needed and you can pull neigh out on a by.
  
  # usplit <- unique(na.omit(DT, cols = splitBy)[[splitBy]])
  
  # GBI for each season
  # gbiLs <- lapply(usplit, function(u) {
  #   gbi <- get_gbi(
  #     DT = nsub[get(splitBy) == u],
  #     group = 'group',
  #     id = idcol
  #   )
  # })

  # Generate networks for each season
  # netLs <- lapply(
  #   gbiLs,
  #   get_network,
  #   data_format = 'GBI',
  #   association_index = 'SRI'
  # )
  
  # gLs <- lapply(
  #   netLs,
  #   graph.adjacency,
  #   mode = 'undirected',
  #   diag = FALSE,
  #   weighted = TRUE
  # )
  
  neigh(nsub, idcol, splitBy)
  
  out <- unique(nsub[, .SD, 
                   .SDcols = c('neighborhood', 'splitNeighborhood', idcol, splitBy)])
  set(out, j = 'nobs', value = n)
  
})
# TODO: check "found duplicate id in a timegroup and/or splitBy - does your group_times threshold match the fix rate?"
out <- rbindlist(nets)

### Multilayer network metrics ----
var <- 'nobs'

# Redundancy
redundancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(out, 'splitNeighborhood', idcol, 'nobs')

# Degree deviation
degdeviation(out, 'splitNeighborhood', idcol, 'nobs')

# Relevance
relevance(out, idcol, splitBy = c('nobs', splitBy))
stopifnot(out[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation

### Output ----
saveRDS(out, 'data/derived-data/5-number-of-observations.Rds')
