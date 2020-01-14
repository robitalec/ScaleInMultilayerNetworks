### Scale in multilayer networks - time windows
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

### Sub data ----
# TODO: add season? 
sub <- DT[Year == 2018]

idcol <- 'ANIMAL_ID'
# keepids <- sub[, .N, c(idcol, 'season')][, .N, idcol][N == 2][[idcol]]
# sub <- sub[get(idcol) %chin% keepids]

### Cast columns ----
sub[, idate := as.IDate(idate)]
sub[, itime := as.ITime(itime)]

### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]


### Variable time window length ----
lengths <- seq(75, 150, 5)
  
lapply(lengths, function(l) {
  col <- paste0('season', l)
  
  sub[between(JDate, 1, 1 + l), (col) := 'winter']
  sub[between(JDate, 215, 215 + l), (col) := 'summer']
})


### Temporal grouping ----
tempthresh <- '5 minutes'

group_times(
  sub,
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)

### Generate networks for each n observations ----
spatthresh <- 50
