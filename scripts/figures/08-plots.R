# === Plots ---------------------------------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'patchwork')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')


# Input -------------------------------------------------------------------
var <- commandArgs(TRUE)[[1]]

if (var == 'lcres') {
  path <- 'data/derived-data/2-landcover-scale.Rds'
} else if (var == 'spatialthreshold') {
  path <- 'data/derived-data/3-spatial-threshold.Rds'
} else if (var == 'time') {
  path <- 'data/derived-data/4-temporal-layers.Rds'
} else if (var == 'nobs') {
  path <- 'data/derived-data/5-number-of-observations.Rds'
} 
DT <- readRDS(path)
alloc.col(DT)


# Recode landcover
# 1 = open, 2 = forest, 3 = foraging (lichen)
DT[get(lccol) == 1, c('lcname', 'layernm') := .('open', paste0(season, '-open'))]
DT[get(lccol) == 2, c('lcname', 'layernm') := .('forest', paste0(season, '-forest'))]
DT[get(lccol) == 3, c('lcname', 'layernm') := .('forage', paste0(season, '-forage'))]


# Var x lab names
varnames <- data.table(
  vars = c('lcres', 'spatialthreshold', 'winlength', 'nobs', 'winpos'),
  varname = c('Landcover Resolution', 'Social Threshold', 'Time Window Length',
              'Number of Observations', 'Time Window Position')
)


# Plots -------------------------------------------------------------------
## Manuscript figures
# Legend position
# TODO: fix
pos1 <- c(0.85, 0.35)
pos2 <- c(0.85, 0.3)


# Plot by landcover
base1 <- ggplot(unique(DT[, .SD, .SDcols = c(var, 'lcname', 'layersim')]), 
            aes(x = get(var), linetype = lcname))

g1 <-
  base1 + geom_line(aes(y = layersim), size = linesize) + 
  ylab('Layer Similarity') +
  expand_limits(y = c(-1, 1)) +
  geom_hline(yintercept = 0) +  
  theme(legend.position = pos2) 

# Plot full, across
base2 <- ggplot(DT[, .SD[1], by = var], 
            aes(x = get(var)), color = 'black')

g2 <- base2 + geom_line(aes(y = mnmultideg), size = linesize) + ylab('Multidegree')
g3 <- base2 + geom_line(aes(y = mndegdev), size = linesize) + ylab('Degree Deviation')
g4 <- base2 + geom_line(aes(y = mnneigh), size = linesize) + ylab('Neighborhood')

g5 <- base2 + geom_line(aes(y = mnconnredund), size = linesize) + 
  ylab('Connective Redundancy') +
  expand_limits(y = c(-0.075, 1))


# Plot within
base3 <- ggplot(DT, aes(x = get(var), color = season, linetype = lcname)) +
  scale_color_manual(values = c(cols$hex[1], cols$hex[5])) 

g6 <- base3 + geom_line(aes(y = mnsplitNeigh), size = linesize) + ylab('Degree')

g7 <- base3 + geom_line(aes(y = mnrelev), size = linesize) + 
  ylab('Layer Relevance') + guides(color = FALSE, linetype = FALSE) +
  expand_limits(y = c(-0.075, 1))

g8 <- base3 + geom_line(aes(y = mngraphstrength), size = linesize) + 
  ylab('Graph Strength') + guides(linetype = FALSE) + 
  expand_limits(y = c(-0.075, 1)) + 
  theme(legend.position = pos1)


# Patchwork
(fig <- (g8 + g7) / (g1 + g5) +
    plot_annotation(tag_levels = 'A') & 
    theme(plot.tag = element_text(size = 14, hjust = 0, vjust = 0),
          legend.key.width = unit(1.4,"cm")) &
    labs(x = varnames[vars == var, varname]) &
    scale_linetype_manual(
      values = linevalues) &
    p)


ggsave(paste0('graphics/figure-', var, '.png'), width = 13, height = 10)


## Supplemental figures
# (g1 + g2  + g3 + g4 + g5) / (g6 + g7 + g8)
  