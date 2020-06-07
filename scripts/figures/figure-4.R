# === Figure 3 ------------------------------------------------------------
# Temporal Layers
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'ggplot2', 'patchwork', 'raster', 'rasterVis')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/03-temporal-layers.Rds')



# Theme -------------------------------------------------------------------
source('scripts/figures/theme.R')



# Plot --------------------------------------------------------------------
xlab <- 'temporal cut'



(gprop <- ggplot(DT) + 
  geom_line(aes(timecut, propedges),
            size = 2) + 
  # guides(color = FALSE) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Edge Overlap') + 
  ylim(0, 1))
  

gstr <- ggplot(DT) +
  geom_line(aes(timecut, graphstrength, group = ANIMAL_ID, color = lcname),
            alpha = 0.3, size = 1.2) +
  geom_line(aes(timecut, meangraphstrength, color = lcname),
            size = 2) +
  facet_grid( ~ lcname) +
  guides(color = FALSE) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = xlab, y = 'Graph Strength') + 
  theme(panel.spacing = unit(1, "lines"))


g30 <- gplot(lc30) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = lcvalcolors) +
  labs(subtitle = '30 m') +
  themelc + 
  guides(fill = FALSE)

g500 <- gplot(lc500) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = lcvalcolors) +
  labs(subtitle = '500 m') +
  themelc + 
  guides(fill = FALSE)

g1000 <- gplot(lc1000) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = lcvalcolors) +
  labs(subtitle = '1000 m') +
  themelc + 
  guides(fill = FALSE)



# Patchwork ---------------------------------------------------------------
layout <- 'AABBCC
           DDDDDE
           FFFFFF'

(g <- g30 + g500 + g1000 + 
   gprop + guide_area() + gstr +
   plot_layout(design = layout,
               guides = 'collect')
)



# Output ------------------------------------------------------------------
ggsave('graphics/figure-3.png',
       g, width = 10, height = 10)

ggsave('graphics/supp-count-lc.png',
       gcount, width = 5, height = 5)
