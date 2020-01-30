### Metrics ====
# Alec Robitaille


### Packages ----
pkgs <- c('data.table', 'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
var <- 'spatialthreshold'
splitBy <- c(splitBy, var)

if (var == 'lcres') {
  path <- 'data/derived-data/2-landcover-scale.Rds'
} else if (var == 'spatialthreshold') {
  path <- 'data/derived-data/3-spatial-threshold.Rds'
} else if (var == 'winlength') {
  path <- 'data/derived-data/4-time-window-length.Rds'
} else if (var == 'nobs') {
  path <- 'data/derived-data/5-number-of-observations.Rds'
} else if (var == 'winpos') {
  path <- 'data/derived-data/6-time-window-position.Rds'
}
DT <- readRDS(path)
alloc.col(DT)


### Multilayer network metrics ----
varby <- c(var, 'season')
matrices <- DT[, property_matrix(.SD, idcol, 'layer', 'splitNeigh'), var]
matrices[, c('season', lccol) := tstrsplit(layer, '-', type.convert = TRUE)]

layer_similarity(matrices, 'FO', c(lccol, var))

DT[matrices, layersim := layersim, on = c(varby, lccol)]

# Multidegree
multi_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Redundancy
connective_redudancy(DT)
stopifnot(DT[!between(connredund, 0, 1), .N] == 0)


# Degree deviation
deviation_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Relevance
# TODO: check range 
layer_relevance(DT, idcol, splitBy = splitBy)
stopifnot(DT[!between(relev, 0, 1), .N] == 0)


### Output 
saveRDS(DT, gsub('.Rds', '-metrics.Rds', path))




## ARCHIVE
# dcast(ml, ANIMAL_ID ~ get(var), value.var = 'cent')

# Network correlations
# netcors <- data.table(
#   cornet = vapply(seq_along(netLs)[-length(netLs)], function(i) {
#     cor(c(netLs[[i]]), c(netLs[[i + 1]]))
#   }, FUN.VALUE = 42.0),
#   spatscale = unique(ml$spatscale)[-length(netLs)])