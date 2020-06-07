# === Time Metrics --------------------------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')


# Input -------------------------------------------------------------------
var <- 'timecut'
path <- 'data/derived-data/03-temporal-layers.Rds'
splitBy <- var

DT <- readRDS(path)
alloc.col(DT)



# Multilayer network metrics ----------------------------------------------
matrices <- property_matrix(DT, idcol, 'splitNeigh', var)

layer_similarity_ordinal(matrices, 'FO', var)

library(ggplot2)


matrices[DT, c('mindate', 'maxdate') := .(mindate, maxdate), on = 'timecut']

ggplot(matrices) + 
  geom_line(aes(timecut, layersim))

ggplot(matrices) + 
  geom_segment(aes(x = mindate, xend = maxdate,
                   y = layersim, yend = layersim))

DT[matrices, layersim := layersim, on = 'layer']

# Multidegree
multi_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Redundancy
connective_redudancy(DT)
# TODO not true
stopifnot(DT[!between(connredund, 0, 1), .N] == 0)


# Degree deviation
deviation_degree(DT, 'splitNeigh', idcol, splitBy = var)

# Relevance
layer_relevance(DT, idcol, splitBy = splitBy)
stopifnot(DT[!between(relev, 0, 1), .N] == 0)

ggplot(DT) + 
  geom_line(aes(mindate, relev, color = ANIMAL_ID)) +
  guides(color = FALSE)

# Mean across individuals (for plots) -------------------------------------
# TODO: check light grey, with mean on top

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
