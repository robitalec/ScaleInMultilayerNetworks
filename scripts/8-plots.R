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
## Manuscript figures

# To average columns...

# Full multilayer - layersd (no need to avg)

# Across layers - degree deviation, neigh, multideg
metriccols <- c('neigh', 'multideg', 'degdev')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = var]

# Within layers - splitNeigh, relev, connredund, graphstrength
metriccols <- c('splitNeigh', 'relev', 'connredund', 'graphstrength')
DT[, paste0('mn', metriccols) := lapply(.SD, mean, na.rm = TRUE), 
   .SDcols = metriccols, by = c(var, splitBy)]

g <- ggplot(DT[, .SD[1], by = var], aes(x = get(var))) +
  guides(color = FALSE) +
  labs(x = var)

g1 <- g + geom_line(aes(y = layersd), color = 'black')
g2 <- g + geom_line(aes(y = mnmultideg))
g3 <- g + geom_line(aes(y = mndegdev))
g4 <- g + geom_line(aes(y = mnneigh))



g <- ggplot(DT, aes(x = get(var), color = layer, group = layer)) +
  guides(color = FALSE) +
  labs(x = var)

# Number of observations vs split neighborhood (by layer) 
g5 <- g + geom_line(aes(y = mnsplitNeigh))

# Number of observations vs layer relevance
g6 <- g + geom_line(aes(y = mnrelev))

# Number of observations vs graph strength
g7 <- g + geom_line(aes(y = mngraphstrength))




## Plots that combine layers
# g <- ggplot(DT, aes(x = get(var),
#                     color = get(idcol), 
#                     group = get(idcol))) +
#   guides(color = FALSE) +
#   labs(x = var)

# DT[, grp := do.call(paste, c(.SD, sep = '-')), .SDcols = splitBy]
# g <- ggplot(DT, aes(x = get(var), color = factor(lc30), group = grp)) + 
#   guides(color = FALSE) + 
#   labs(x = var)



# Number of observations vs degree deviation
g2 <- g + geom_line(aes(y = degdev))

# Number of observations vs multidegree
g3 <- g + geom_line(aes(y = multideg))

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
  g3 /
  g4 / 
  g5 /
  g6


## Supplemental figures