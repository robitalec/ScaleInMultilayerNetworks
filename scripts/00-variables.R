# === Variables -----------------------------------------------------------
## ID
idcol <- 'ANIMAL_ID'

## Spatial
utm21N <- '+proj=utm +zone=21 ellps=WGS84'
projCols <- c('EASTING', 'NORTHING')
xcol <- 'X_COORD'
ycol <- 'Y_COORD'

## Temporal
datecol <- 'idate'
timecol <- 'itime'

# Time zone 
tz <- 'America/St_Johns'


# split by
lccol <- 'lc'
splitBy <- c('season', lccol)

## spatsoc
spatthresh <- 50
tempthresh <- '5 minutes'

## Window lengths and positions
# winlength <- 48
# maxwinlength <- 100
# winlengths <- seq(40, maxwinlength, 5)
# 
# winpositions <- seq(1, 48, by = 1)

# Seasons
winterlow <- 1
winterhigh <- 48
summerlow <- 215
summerhigh <- 263