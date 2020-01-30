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

## Theme
p <- theme(legend.position = 'none',
           axis.text.x = element_text(size = 14, color = "black", vjust = 0.65),
           axis.text.y = element_text(size = 14, color = "black"),
           axis.title = element_text(size = 18),
           panel.grid.minor = element_blank(),
           panel.background = element_blank(),
           panel.border = element_rect(
             colour = "black",
             fill = NA,
             size = 1))

## Colors
# 1 = open, 2 = forest, 3 = lichen
cols <- DT[, .(layer = sort(unique(layer)))][, 
  .(layer, hex = c('#8c510a','#d8b365','#c4b99c',
                   '#01665e','#5ab4ac', '#9fbbb7'))]

greys <- DT[, .(lc30 = sort(unique(lc30)))][, 
  .(lc30, hex = c('#6b6b6b', '#c2c2c2', '#919191'))]

# Plot by landcover
base1 <- ggplot(unique(DT[, .SD, .SDcols = c(var, lccol, 'layersim')]), 
            aes(x = get(var), color = factor(get(lccol)))) +
  guides(color = FALSE) +
  labs(x = var) + 
  p + 
  scale_color_manual(values = greys$hex)

g1 <- base1 + geom_line(aes(y = (layersim))) + ylab('Layer Variation')

# Plot full, across
base2 <- ggplot(DT[, .SD[1], by = var], 
            aes(x = get(var)), color = 'black') +
  guides(color = FALSE) +
  labs(x = var) +
  p

g2 <- base2 + geom_line(aes(y = mnmultideg)) + ylab('Multidegree')
g3 <- base2 + geom_line(aes(y = mndegdev)) + ylab('Degree Deviation')
g4 <- base2 + geom_line(aes(y = mnneigh)) + ylab('Neighborhood')
g5 <- base2 + geom_line(aes(y = mnconnredund)) + ylab('Connective Redundancy')


# Plot within
base3 <- ggplot(DT, aes(x = get(var), color = layer, group = layer)) +
  guides(color = FALSE) +
  labs(x = var) + 
  p + 
  scale_color_manual(values = cols$hex)

  

g6 <- base3 + geom_line(aes(y = mnsplitNeigh)) + ylab('Degree')
g7 <- base3 + geom_line(aes(y = mnrelev)) + ylab('Relevance')
g8 <- base3 + geom_line(aes(y = mngraphstrength)) + ylab('Graph Strength')


# Patchwork
(fig2 <- (g1 + g5) / (g7 + g8) )


ggsave('graphics/figure2.png', width = 10, height = 7)


## Supplemental figures
(g1 + g2  + g3 + g4 + g5) / (g6 + g7 + g8)
  