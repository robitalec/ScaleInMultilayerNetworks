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
var <- 'winlength'

if (var == 'lcres') {
  DT <- readRDS('data/derived-data/2-landcover-scale.Rds')
} else if (var == 'spatialthreshold') {
  DT <- readRDS('data/derived-data/3-spatial-threshold.Rds')
} else if (var == 'winlength') {
  DT <- readRDS('data/derived-data/4-time-window-length.Rds')
} else if (var == 'nobs') {
  DT <- readRDS('data/derived-data/5-number-of-observations.Rds')
} else if (var == 'winpos') {
  DT <- readRDS('data/derived-data/6-time-window-position.Rds')
}

alloc.col(DT)


### Plots ----
# TODO: think about cutting these off where they settle and including extended versions in supplemental

# ggplot(DT) +
# geom_line(aes(get(var), netcor))

# To average columns...
# metriccols <- c('multideg', 'degdev', 'splitNeighborhood', 'relev')
# DT[, (metriccols) := lapply(.SD, mean), .SDcols = metriccols, by = get(var)]

## Plots that combine seasons
g <- ggplot(DT, aes(x = get(var),
                     color = get(idcol),
                     group = get(idcol))) + 
  guides(color = FALSE) + 
  labs(x = var)

# Number of observations vs multidegree
g1 <- g + geom_line(aes(y = multideg))

# Number of observations vs degree deviation
g2 <- g + geom_line(aes(y = degdev))

# Number of observations vs neighborhood (combined layers)
g3 <- g + geom_line(aes(y = neigh))

## Plots that separate seasons
g <- g +
  facet_grid(~season + lc30) +
  guides(color = FALSE)

# Number of observations vs split neighborhood (by layer) 
g4 <- g + geom_line(aes(y = splitNeigh))

# Number of observations vs layer relevance
g5 <- g + geom_line(aes(y = relev))

# Number of observations vs eigenvector centrality
g6 <- g + geom_line(aes(y = eigcent))


g1 / 
  g2 / 
  # g3 / 
  g4 / 
  # g5 /
  g6
