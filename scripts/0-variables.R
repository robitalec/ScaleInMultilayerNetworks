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

# Seasons
winterlow <- 1
winterhigh <- 48
summerlow <- 215
summerhigh <- 263

splitBy <- 'season'

## spatsoc
spatthresh <- 50
tempthresh <- '5 minutes'
