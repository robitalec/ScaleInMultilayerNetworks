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

### Sub data ----
## 2017 summer and 2018 winter
sub <- DT[Year >= 2017 & JDate > summerlow | Year == 2018]

# Sub only individuals with data in both seasons
dropids <- c("FO2017011", "FO2016015", "FO2016009", "FO2018002",
             "FO2016006", "FO2016008", "FO2016003", "FO2016011")
sub <- sub[!get(idcol) %in% dropids]
subseasons <- sub[!is.na(season)]

### Output ----
saveRDS(sub, 'data/derived-data/sub-fogo-caribou.Rds')
saveRDS(subseasons, 'data/derived-data/sub-seasons-fogo-caribou.Rds')
