### Plots ====
# Alec Robitaille


### Packages ----
pkgs <- c('data.table',
          'ggplot2',
          'patchwork')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
var <- 'winpos'

if (var == 'lcres') {
  DT <- readRDS('data/derived-data/2-landcover-scale-metrics.Rds')
} else if (var == 'spatialthreshold') {
  DT <- readRDS('data/derived-data/3-spatial-threshold-metrics.Rds')
} else if (var == 'winlength') {
  DT <- readRDS('data/derived-data/4-time-window-length-metrics.Rds')
} else if (var == 'nobs') {
  DT <- readRDS('data/derived-data/5-number-of-observations-metrics.Rds')
} else if (var == 'winpos') {
  DT <- readRDS('data/derived-data/6-time-window-position-metrics.Rds')
}

alloc.col(DT)


### Plots ----
## Manuscript figures

# To average columns...

# Full multilayer - layersd (no need to avg)

# Across layers - degree deviation, neigh, multideg, connredund
metriccols <- c('neigh', 'multideg', 'degdev', 'connredund')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = var]

# Within layers - splitNeigh, relev, connredund, graphstrength
metriccols <- c('splitNeigh', 'relev', 'graphstrength')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = c(var, splitBy)]

# Plot seasons
base1 <- ggplot(DT[, .SD, by = var], 
            aes(x = get(var), color = season)) +
  guides(color = FALSE) +
  labs(x = var)

g1 <- base1 + geom_line(aes(y = layervar)) + ylab('Layer Variation')

# Plot full, across
base2 <- ggplot(DT[, .SD[1], by = var], 
            aes(x = get(var)), color = 'black') +
  guides(color = FALSE) +
  labs(x = var)

g2 <- base2 + geom_line(aes(y = mnmultideg)) + ylab('Multidegree')
g3 <- base2 + geom_line(aes(y = mndegdev)) + ylab('Degree Deviation')
g4 <- base2 + geom_line(aes(y = mnneigh)) + ylab('Neighborhood')
g5 <- base2 + geom_line(aes(y = mnconnredund)) + ylab('Connective Redundancy')


# Plot within
base3 <- ggplot(DT, aes(x = get(var), color = layer, group = layer)) +
  guides(color = FALSE) +
  labs(x = var)

g6 <- base3 + geom_line(aes(y = mnsplitNeigh)) + ylab('Degree')
g7 <- base3 + geom_line(aes(y = mnrelev)) + ylab('Relevance')
g8 <- base3 + geom_line(aes(y = mngraphstrength)) + ylab('Graph Strength')


# Patchwork
(g1 + g5) / (g7 + g8)


## Supplemental figures
(g1 + g2  + g3 + g4 + g5) / (g6 + g7 + g8)
  