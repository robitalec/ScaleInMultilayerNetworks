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


### Temporal grouping with spatsoc ----
tempthresh <- '5 minutes'
spatthresh <- 50

alloc.col(DT)
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

  usplit <- unique(na.omit(DT, cols = splitBy)[[splitBy]])
  
  # GBI for each season
  gbiLs <- lapply(usplit, function(u) {
    gbi <- get_gbi(
      DT = nsub[get(splitBy) == u],
      group = 'group',
      id = idcol
    )
  })

  # Generate networks for each season
  netLs <- lapply(
    gbiLs,
    get_network,
    data_format = 'GBI',
    association_index = 'SRI'
  )
  
  gLs <- lapply(
    netLs,
    graph.adjacency,
    mode = 'undirected',
    diag = FALSE,
    weighted = TRUE
  )
  
  names(gLs) <- paste(n, usplit, sep = '-')
  
  neigh(nsub, idcol, splitBy)
  
  out <- unique(nsub[, .SD, 
                   .SDcols = c('neighborhood', 'splitNeighborhood', idcol, splitBy)])
  set(out, j = 'nobs', value = n)
  
})

DT <- rbindlist(nets)

### Multilayer network metrics ----
# Redundancy
redundancy(DT)
stopifnot(DT[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(DT, 'splitNeighborhood', idcol, 'nobs')

# Degree deviation
degdeviation(DT, 'splitNeighborhood', idcol, 'nobs')

# Relevance
relevance(DT, idcol, splitBy = c('nobs', splitBy))
stopifnot(DT[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation

### Plots ----
# ggplot(DT) +
  # geom_line(aes(nobs, netcor))

# To average columns...
# metriccols <- c('multideg', 'degdev', 'splitNeighborhood', 'relev')
# DT[, (metriccols) := lapply(.SD, mean), .SDcols = metriccols, by = nobs]

## Plots that combine seasons
g <- ggplot(DT, aes(x = nobs,
                    color = get(idcol),
                    group = get(idcol))) + 
  guides(color = FALSE)

# Number of observations vs multidegree
g1 <- g + geom_line(aes(y = multideg))

# Number of observations vs degree deviation
g2 <- g + geom_line(aes(y = degdev))

# Number of observations vs neighborhood (combined layers)
g3 <- g + geom_line(aes(y = neighborhood))

## Plots that separate seasons
g <- g +
  facet_wrap(~season) +
  guides(color = FALSE)

# Number of observations vs split neighborhood (by layer) 
g4 <- g + geom_line(aes(y = splitNeighborhood))

# Number of observations vs layer relevance
g5 <- g + geom_line(aes(y = relev))


library(patchwork)

# TODO: problem is none of these are weighted, they are all integer, so not varying after all individuals
# TODO: think about cutting these off where they settle and including extended versions in supplemental
g1 / 
  g2 / 
  # g3 / 
  g4 / 
  g5 

