# === Data Prep -----------------------------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'rgdal', 'raster')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')



# Input -------------------------------------------------------------------
DT <- fread('data/raw-data/FogoCaribou.csv')

lc <- raster('../nl-landcover/output/fogo_lc.tif')


# Date time ---------------------------------------------------------------
DT[, c(datecol, timecol) := .(as.IDate(get(datecol), tz = tz), as.ITime(get(timecol)))]
DT[, 'datetime' := as.POSIXct(paste(get(datecol), get(timecol)), tz)]

# Seasons
DT[between(JDate, winterlow, winterhigh), season := 'winter']
DT[between(JDate, summerlow, summerhigh), season := 'summer']

# Drop individuals 
indianisland <- c('FO2016011', 'FO2017013', 'FO2017001')
diffixrate <- 'FO2016014'
dropind <- diffixrate#c(indianisland, diffixrate)

# which individual driving 500m

DT <- DT[!ANIMAL_ID %in% dropind] 


# Project relocations -----------------------------------------------------
DT[, (projCols) := as.data.table(project(cbind(get(xcol), get(ycol)), utm21N))]



# Land cover prep ---------------------------------------------------------
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



# Sample land cover -------------------------------------------------------
### Landcover sample ----
DT[, (lccol) := extract(reclass, matrix(c(EASTING, NORTHING), ncol = 2))]



# Sub data ----------------------------------------------------------------
## 2017 summer and 2018 winter
sub <- DT[(Year == 2017 & JDate > 11) |
            Year == 2018 |
            (Year == 2019 & JDate < 87)]

# ggplot(DT[, uniqueN(ANIMAL_ID), .(d = week(datetime), y = year(datetime))]) + geom_point(aes(d, V1, color = factor(y)))
# DT[, unique(ANIMAL_ID), .(year(datetime), week(datetime))][, .N, V1]
# 2017 1 -> 110 =  10
# 2017 110 -> 2018 265 =  19
# 2018 265 -> 2019 87 = 15
# 2019 88 and on = 9

## Which individuals have data in both seasons?
# TODO: drop if drop time sensitivity
# Window length
# l <- lapply(winlengths, function(l) {
#   col <- paste0('season', l)
#   
#   sub[between(JDate, winterlow, winterlow + l), (col) := 'winter']
#   sub[between(JDate, summerlow, summerlow + l), (col) := 'summer']
#   
#   # Fake output
#   l
# })

# winlendrop <- lapply(paste0('season', winlengths), function(col) {
#   sub[, sum(!is.na(get(col))), c(idcol, col)][!is.na(get(col)), .N, idcol][N < 2, get(idcol)]
# })

# sub[, (grep('season[1-9]', colnames(sub), value = TRUE)) := NULL]

# Window position
# l <- lapply(winpositions, function(pos) {
#   col <- paste0('season', pos)
#   
#   sub[between(JDate, winterlow + pos, winterlow + pos + winlength), (col) := 'winter']
#   sub[between(JDate, summerlow + pos, summerlow + pos + winlength), (col) := 'summer']
#   
#   # Fake output
#   pos
# })

# winposdrop <- lapply(paste0('season', winpositions), function(col) {
#   sub[, sum(!is.na(get(col))), c(idcol, col)][!is.na(get(col)), .N, idcol][N < 2, get(idcol)]
# })

# sub[, (grep('season[1-9]', colnames(sub), value = TRUE)) := NULL]


# Combine lists
# dropids <- unique(c(unlist(winlendrop), unlist(winposdrop)))

# sub <- sub[!get(idcol) %in% dropids]
subseasons <- sub[!is.na(season)]


# Output ------------------------------------------------------------------
saveRDS(sub, 'data/derived-data/01-sub-fogo-caribou.Rds')
saveRDS(subseasons, 'data/derived-data/01-sub-seasons-fogo-caribou.Rds')
# saveRDS(all, 'data/derived-data/01-all-fogo-caribou.Rds')
saveRDS(reclass, 'data/derived-data/01-reclass-lc.Rds')