### Scale in multilayer networks - data prep
# Alec Robitaille

### Packages ----
pkgs <- c('data.table', 'rgdal')
p <- lapply(pkgs, library, character.only = TRUE)

# TODO: read in as rds everywhere else
# TODO: timezones
# TODO: rm old prep from all
# TODO: confirm seasons
# TODO: dont drop if na season here
# TODO: which individuals are dropped

### Data ----
DT <- fread('data/raw-data/FogoCaribou.csv')

source('scripts/0-variables.R')


### Date and time columns ----
DT[, c(datecol, timecol) := .(as.IDate(get(datecol)), as.ITime(get(timecol)))]

## Seasons
DT[between(JDate, winterlow, winterhigh), season := 'winter']
DT[between(JDate, summerlow, summerhigh), season := 'summer']

### Project relocations ----
DT[, (projCols) := as.data.table(project(cbind(get(xcol), get(ycol)), utm21N))]

### Sub data ----
# Sub only 2018 data
sub2018 <- DT[Year == 2018]

# Sub only individuals with data in both seasons
keepids <- sub2018[, .N, c(idcol, 'season')][!is.na(season), .N, idcol][N == 2][[idcol]]
subSeasons <- sub2018[get(idcol) %chin% keepids]


### Output ----
saveRDS(sub2018, 'data/derived-data/sub-2018-fogo-caribou.Rds')
saveRDS(subSeasons, 'data/derived-data/sub-seasons-fogo-caribou.Rds')
