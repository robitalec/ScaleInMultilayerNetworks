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
whichvar <- 'winlength'

if (whichvar == 'winlength') {
  DT <- readRDS('data/derived-data/4-time-window-length.Rds')
}


alloc.col(DT)


### Plots ----
# ggplot(DT) +
# geom_line(aes(get(var), netcor))

# To average columns...
# metriccols <- c('multideg', 'degdev', 'splitNeighborhood', 'relev')
# DT[, (metriccols) := lapply(.SD, mean), .SDcols = metriccols, by = get(var)]

## Plots that combine seasons
g <- ggplot(out, aes(x = get(var),
                     color = get(idcol),
                     group = get(idcol))) + 
  guides(color = FALSE) + 
  labs(x = var)

# Number of observations vs multidegree
g1 <- g + geom_line(aes(y = multideg))

# Number of observations vs degree deviation
g2 <- g + geom_line(aes(y = degdev))

# Number of observations vs neighborhood (combined layers)
g3 <- g + geom_line(aes(y = neighborhood))

## Plots that separate seasons
g <- g +
  facet_wrap(~season) +
  guides(color = FALSE)

# Number of observations vs split neighborhood (by layer) 
g4 <- g + geom_line(aes(y = splitNeighborhood))

# Number of observations vs layer relevance
g5 <- g + geom_line(aes(y = relev))


library(patchwork)

# TODO: problem is none of these are weighted, they are all integer, so not varying after all individuals
# TODO: think about cutting these off where they settle and including extended versions in supplemental
g1 / 
  g2 / 
  # g3 / 
  g4 / 
  g5 
