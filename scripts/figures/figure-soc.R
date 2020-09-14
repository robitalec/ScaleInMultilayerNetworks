# === Figure 5 ------------------------------------------------------------
# Spatial Distance Threshold
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'patchwork',
          'ggnetwork')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/04-spatial-threshold.Rds')
netDT <- readRDS('data/derived-data/04-spatial-threshold-fig-data.Rds')


legend <- data.table(lc = c(1, 2, 3),
                     lcname = c('Open', 'Forest', 'Foraging'))

DT[legend, lcname := lcname, on = 'lc']
netDT[legend, lcname := lcname, on = 'lc']


# Theme -------------------------------------------------------------------
if(interactive()) {
  source('scripts/figures/theme.R')
}



# Plot --------------------------------------------------------------------
xlab <- 'Social Distance Threshold'

DT[, meangraphstrength := mean(graphstrength), layer]


# Graph strength
gstr <- ggplot(DT, aes(color = lcname, group = lcname)) +
  geom_line(aes(x = threshold, y = graphstrength, 
                group = ANIMAL_ID),
            alpha = 0.3, size = 1.2) + 
  geom_line(aes(x = threshold, y = meangraphstrength),
            size = 2) + 
  facet_wrap(~lcname) +
  guides(color = FALSE) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = xlab, y = 'Graph Strength')


# Multidegree
gmult <- ggplot(DT, aes(group = ANIMAL_ID)) +
  geom_line(aes(x = threshold, y = multideg)) +
  base +
  labs(x = xlab, y = 'Multidegree')



# Patchwork ---------------------------------------------------------------
(g <- gstr + 
   plot_layout()
)


# Output ------------------------------------------------------------------
ggsave('graphics/figure-soc.png',
       g, width = 10, height = 5)