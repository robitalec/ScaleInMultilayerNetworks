### Scale in multilayer networks - data prep
# Alec Robitaille

### Packages ----
pkgs <- c('data.table', 'rgdal', 'raster')
p <- lapply(pkgs, library, character.only = TRUE)

# TODO: timezones

### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- fread('data/raw-data/FogoCaribou.csv')

lc <- raster('../nl-landcover/output/fogo_lc.tif')

### Date and time columns ----
DT[, c(datecol, timecol) := .(as.IDate(get(datecol)), as.ITime(get(timecol)))]

# Seasons
DT[between(JDate, winterlow, winterhigh), season := 'winter']
DT[between(JDate, summerlow, summerhigh), season := 'summer']

# Drop individuals on Indian Island
DT <- DT[ANIMAL_ID != "FO2016011" & 
         ANIMAL_ID != "FO2017001" & 
         ANIMAL_ID != "FO2017013"] 

### Project relocations ----
DT[, (projCols) := as.data.table(project(cbind(get(xcol), get(ycol)), utm21N))]

### Landcover prep ----
water <- 7
open <- c(1, 6, 9)
forest <- c(2, 3, 4, 5)
lichen <- 8

mlc <- mask(lc, lc == water, maskvalue = TRUE)

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

reclass <- reclassify(mlc, rcl, include.lowest = TRUE)


### Landcover sample ----
DT[, (lccol) := extract(reclass, matrix(c(EASTING, NORTHING), ncol = 2))]

### Sub data ----
## 2017 summer and 2018 winter
sub <- DT[Year >= 2017 & JDate > summerlow | 
            Year == 2018 & JDate < winterlow + maxwinlength]


## Which individuals have data in both seasons?
# Window length
l <- lapply(winlengths, function(l) {
  col <- paste0('season', l)
  
  sub[between(JDate, winterlow, winterlow + l), (col) := 'winter']
  sub[between(JDate, summerlow, summerlow + l), (col) := 'summer']
  
  # Fake output
  l
})

winlendrop <- lapply(paste0('season', winlengths), function(col) {
  sub[, sum(!is.na(get(col))), c(idcol, col)][!is.na(get(col)), .N, idcol][N < 2, get(idcol)]
})

sub[, (grep('season[1-9]', colnames(sub), value = TRUE)) := NULL]

# Window position
l <- lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  
  sub[between(JDate, winterlow + pos, winterlow + pos + winlength), (col) := 'winter']
  sub[between(JDate, summerlow + pos, summerlow + pos + winlength), (col) := 'summer']
  
  # Fake output
  pos
})

winposdrop <- lapply(paste0('season', winpositions), function(col) {
  sub[, sum(!is.na(get(col))), c(idcol, col)][!is.na(get(col)), .N, idcol][N < 2, get(idcol)]
})

sub[, (grep('season[1-9]', colnames(sub), value = TRUE)) := NULL]


# Combine lists
dropids <- unique(c(unlist(winlendrop), unlist(winposdrop)))

sub <- sub[!get(idcol) %in% dropids]
subseasons <- sub[!is.na(season)]

### Output ----
saveRDS(sub, 'data/derived-data/1-sub-fogo-caribou.Rds')
saveRDS(subseasons, 'data/derived-data/1-sub-seasons-fogo-caribou.Rds')

saveRDS(reclass, 'data/derived-data/1-reclass-lc.Rds')