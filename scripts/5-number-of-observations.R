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
# TODO: rm [1:5]
# TODO: rm 1 since no cross season with one sample
# TODO: even sample n by season
maxn <- 300 #sub[, uniqueN(timegroup)])
randobs <- sub[, sample(timegroup, size = maxn), season]$V1

#sub[, uniqueN(timegroup)]), 
graphs <- lapply(seq(2, maxn, by = 2), function(n) {
  # Randomly select n observations
  nsub <- sub[timegroup %in% randobs[1:n]]
  # nsub[, uniqueN(timegroup)]
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
  gLs
})

### Multilayer network metrics ----
multdeg <- rbindlist(lapply(graphs, function(g) {
  deg <- lapply(g, degree)
  rbindlist(lapply(deg, stack), idcol = 'by')
}))

setnames(multdeg, c('by', 'deg', idcol))

multdeg[, c('nobs', 'season') := tstrsplit(by, '-', type.convert = TRUE)]

multdeg[, mdeg := sum(deg), by = c('by', idcol)]


ggplot(multdeg) + 
  geom_line(aes(nobs, mdeg, color = get(idcol), group = get(idcol))) +
  facet_wrap(~get(idcol)) +
  guides(color = FALSE)


ggplot(multdeg) + 
  geom_line(aes(nobs, deg, color = get(idcol), group = get(idcol))) +
  facet_wrap(~get(idcol) + season)

