### Scale in multilayer networks - data prep
# Alec Robitaille

### Packages ----
pkgs <- c('data.table', 'rgdal')
p <- lapply(pkgs, library, character.only = TRUE)

# TODO: timezones
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

### Landcover prep ----
open <- c(1, 6, 7, 9)
forest <- c(2, 3, 4, 5)
lichen <- 8

rcl <- matrix(c(
  open,
  forest,
  lichen,
  rep(1, length(open)),
  rep(2, length(forest)),
  rep(3, length(lichen))
),
ncol = 2)
rclnms <- list(open = 1, forest = 2, lichen = 3)

reclass <- reclassify(mlc, rcl)


### Landcover sample ----
DT[, 'lc30' := extract(reclass, matrix(c(EASTING, NORTHING), ncol = 2))]

### Sub data ----
## 2017 summer and 2018 winter
sub <- DT[Year >= 2017 & JDate > summerlow | Year == 2018 & JDate < winterlow + 100]

# Sub only individuals with data in both seasons
dropids <- c("FO2017011", "FO2016015", "FO2016009", "FO2018002",
             "FO2016006", "FO2016008", "FO2016003", "FO2016011")
sub <- sub[!get(idcol) %in% dropids]
subseasons <- sub[!is.na(season)]

### Output ----
saveRDS(sub, 'data/derived-data/1-sub-fogo-caribou.Rds')
saveRDS(subseasons, 'data/derived-data/1-sub-seasons-fogo-caribou.Rds')

saveRDS(reclass, 'data/derived-data/1-reclass-lc.Rds')