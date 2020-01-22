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
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)

### Generate networks for each n observations ----
nets <- lapply(winlengths, function(len) {
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
  
  # usplit <- unique(na.omit(DT, cols = col)[[col]])
  # 
  # # GBI for each season
  # gbiLs <- lapply(usplit, function(u) {
  #   gbi <- get_gbi(
  #     DT = DT[get(col) == u],
  #     group = 'group',
  #     id = idcol
  #   )
  # })
  # 
  # # Generate networks for each season
  # netLs <- lapply(
  #   gbiLs,
  #   get_network,
  #   data_format = 'GBI',
  #   association_index = 'SRI'
  # )
  # 
  # gLs <- lapply(
  #   netLs,
  #   graph.adjacency,
  #   mode = 'undirected',
  #   diag = FALSE,
  #   weighted = TRUE
  # )
  # names(gLs) <- paste0(col, '-', usplit)
  # gLs
  
  neigh(sub, idcol, col)
  
  outcols <- c('neighborhood', 'splitNeighborhood', idcol, col)
  out <- unique(sub[, .SD, .SDcols = outcols])
  setnames(out, col, 'season')
  set(out, j = 'winlength', value = len)
})

# TODO: fix new data 'found duplicate id in a timegroup and/or splitBy - does your group_times threshold match the fix rate?'

out <- rbindlist(nets)

### Multilayer network metrics ----
var <- 'winlength'

# Redundancy
redundancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(out, 'splitNeighborhood', idcol, var)

# Degree deviation
degdeviation(out, 'splitNeighborhood', idcol, var)

# Relevance
relevance(out, idcol, var, splitBy = splitBy)
stopifnot(out[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation

### Plots ----
# ggplot(DT) +
# geom_line(aes(get(var), netcor))

# To average columns...
# metriccols <- c('multideg', 'degdev', 'splitNeighborhood', 'relev')
# DT[, (metriccols) := lapply(.SD, mean), .SDcols = metriccols, by = get(var)]

## Plots that combine seasons
g <- ggplot(out, aes(x = get(var),
                     color = get(idcol),
                     group = get(idcol))) + 
  guides(color = FALSE) + 
  labs(x = var)

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

