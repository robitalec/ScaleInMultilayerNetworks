### Scale in multilayer networks - number of observations
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
          'ggplot2',
          'spatsoc',
          'rgdal',
          'asnipe',
          'igraph')
p <- lapply(pkgs, library, character.only = TRUE)


# TODO: make this a package
source('R/metrics.R')

### Data ----
DT <- fread('data/FogoCaribou.csv')


### Date and time columns ----
DT[, c('idate', 'itime') := .(as.IDate(idate), as.ITime(itime))]

## Seasons - Winter: 1-75, Summer: 215-290
DT[between(JDate, 1, 75), season := 'winter']
DT[between(JDate, 215, 290), season := 'summer']

splitBy <- 'season'

### Sub data ----
sub <- DT[Year == 2018  & !is.na(season)]

idcol <- 'ANIMAL_ID'
keepids <- sub[, .N, c(idcol, 'season')][, .N, idcol][N == 2][[idcol]]
sub <- sub[get(idcol) %chin% keepids]

### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]

### Temporal grouping with spatsoc ----
tempthresh <- '5 minutes'
spatthresh <- 50

group_times(
  sub,
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)

### Generate networks for each n observations ----
maxn <- 750 #sub[, uniqueN(timegroup)]
nstep <- 25
# Randomly select n max observations
randobs <- sub[, sample(unique(timegroup), size = maxn), season]

nets <- lapply(seq(10, maxn, by = nstep), function(n) {
  # Select first n random timegroups, 
  #  adding new observations to the tail with each iteration
  nsub <- sub[timegroup %in% randobs[, .SD[1:n], season]$V1]

  # Spatial grouping with spatsoc
  group_pts(
    nsub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = splitBy
  )

  usplit <- unique(nsub[[splitBy]])
  
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


## Plots that combine seasons
# Number of observations vs multidegree
ggplot(DT) +
  geom_line(aes(nobs, multideg, color = get(idcol), group = get(idcol))) +
  # facet_wrap(~get(idcol)) +
  guides(color = FALSE)

# Number of observations vs degree deviation
ggplot(DT) +
  geom_line(aes(nobs, degdev, color = get(idcol), group = get(idcol))) +
  # facet_wrap(~get(idcol)) +
  guides(color = FALSE)

# Number of observations vs neighborhood (combined layers)
ggplot(DT) +
  geom_line(aes(nobs, neighborhood, color = get(idcol), group = get(idcol))) +
  # facet_wrap(~get(idcol)) +
  guides(color = FALSE)


## Plots that separate seasons
# Number of observations vs layer relevance
ggplot(DT) + 
  geom_line(aes(nobs, relev, group  = get(idcol), color = get(idcol))) + 
  facet_wrap(~season) +
  guides(color = FALSE)

# Number of observations vs split neighborhood (by layer) 
ggplot(DT) +
  geom_line(aes(nobs, splitNeighborhood, color = get(idcol), group = get(idcol))) +
  facet_wrap(~season)
  # facet_wrap(~get(idcol)) 

# Number of observations vs degree (by layer) (same plot as split neighborhod)
ggplot(DT) +
  geom_line(aes(nobs, splitNeighborhood, color = get(idcol), group = get(idcol))) +
  facet_wrap(~season)

