### Scale in multilayer networks - data prep
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'ggplot2',
					'spatsoc',
					'multinet',
					'rgdal',
					'asnipe',
					'raster',
					'igraph',
					'grainchanger')
p <- lapply(pkgs, library, character.only = TRUE)

### Data ----
DT <- fread('data/FogoCaribou.csv')


# TODO: add seasons
# TODO: output to rds
# TODO: read in as rds everywhere else
# TODO: rm old prep from all
# TODO: confirm seasons
# TODO: dont drop if na season here
# TODO: only 2018
# TODO: which individuals are dropped


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


### Output ----
