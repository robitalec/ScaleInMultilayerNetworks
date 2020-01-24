### Metrics ====
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
  path <- 'data/derived-data/2-landcover-scale.Rds'
  DT <- readRDS(path)
} else if (var == 'spatialthreshold') {
  path <- 'data/derived-data/3-spatial-threshold.Rds'
  DT <- readRDS(path)
} else if (var == 'winlength') {
  path <- 'data/derived-data/4-time-window-length.Rds'
  DT <- readRDS(path)
} else if (var == 'nobs') {
  path <- 'data/derived-data/5-number-of-observations.Rds'
  DT <- readRDS(path)
} else if (var == 'winpos') {
  path <- 'data/derived-data/6-time-window-position.Rds'
  DT <- readRDS(path)
}

alloc.col(DT)

### Metrics ----


