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
idcol <- 'ANIMAL_ID'

# dropid <- c('FO2016011', 'FO2017001', 'FO2017013', 'FO2016006')
# & !(ANIMAL_ID %in% dropid)
sub <- DT[Year == 2018  & !is.na(season)]

keepids <- sub[, .N, .(ANIMAL_ID, season)][, .N, ANIMAL_ID][N == 2, ANIMAL_ID]
sub <- sub[ANIMAL_ID %chin% keepids]

### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]

### Temporal grouping with spatsoc ----
tempthresh <- '5 minutes'
spatthresh <- 50

group_times(
  DT,
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)


### Randomly select n observations ----
# TODO: drop NA season

nobs <- DT[, unique(timegroup)]
# TODO: rm [1:5]
lapply(nobs[1:5], function(n) {
  sub <- DT[timegroup %in% sample(timegroup, size = n)]
  
})
  