# === Metrics -------------------------------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')


# Input -------------------------------------------------------------------
# var <- commandArgs(TRUE)[[1]]
var <- 'timecut'

if (var == 'lcres') {
  path <- 'data/derived-data/2-landcover-scale.Rds'
  splitBy <- c(splitBy, var)
} else if (var == 'spatialthreshold') {
  path <- 'data/derived-data/3-spatial-threshold.Rds'
} else if (var == 'timecut') {
  path <- 'data/derived-data/4-temporal-layers.Rds'
  splitBy <- var
} else if (var == 'nobs') {
  path <- 'data/derived-data/5-number-of-observations.Rds'
} 
DT <- readRDS(path)
alloc.col(DT)



# Multilayer network metrics ----------------------------------------------
matrices <- DT[, property_matrix(.SD, idcol, 'layer', 'splitNeigh'), var]
matrices[, c('season', lccol) := tstrsplit(layer, '-', type.convert = TRUE)]

layer_similarity(matrices, 'FO', c(lccol, var))

DT[matrices, layersim := layersim, on = c(var, 'season', lccol)]

# Multidegree
multi_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Redundancy
connective_redudancy(DT)
stopifnot(DT[!between(connredund, 0, 1), .N] == 0)


# Degree deviation
deviation_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Relevance
layer_relevance(DT, idcol, splitBy = splitBy)
stopifnot(DT[!between(relev, 0, 1), .N] == 0)



# Mean across individuals (for plots) -------------------------------------
# TODO: check light grey, with mean on top
splitBy <- c('season', lccol)

# Across layers - degree deviation, neigh, multideg, connredund
metriccols <- c('neigh', 'multideg', 'degdev', 'connredund')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = var]

# Within layers - splitNeigh, relev, connredund, graphstrength
metriccols <- c('splitNeigh', 'relev', 'graphstrength')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = c(var, splitBy)]


# Output ------------------------------------------------------------------
saveRDS(DT, gsub('.Rds', '-metrics.Rds', path))