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
  geom_segment(aes(x = mindate, xend = maxdate, 
                   y = propedges, yend = propedges),
            size = 2) + 
    # geom_segment(aes(x = mindate, xend = maxdate, 
    #                  y = layersim, yend = layersim)) + 
  # guides(color = FALSE) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = xlab, y = 'Edge Overlap') + 
  ylim(0, 1)
)

DT[, meangraphstrength := mean(graphstrength), by = timecut]

(gstr <- ggplot(DT) +
  geom_segment(aes(x = mindate, xend = maxdate, 
                   y = graphstrength, yend = graphstrength),
               size = 0.5, alpha = 0.3) + 
  geom_segment(aes(x = mindate, xend = maxdate, 
                   y = meangraphstrength, yend = meangraphstrength),
               size = 2) + 
  guides(color = FALSE) +
  base +
  labs(x = xlab, y = 'Graph Strength'))

DT[, middate := mean(c(mindate, maxdate)), layer]
(gsim <- ggplot(DT) +
    geom_line(aes(x = middate, layersim)) + 
    geom_segment(aes(x = mindate, xend = maxdate, 
                     y = layersim, yend = layersim),
                 size = 0.5, alpha = 0.3) + 
    guides(color = FALSE) +
    base +
    labs(x = xlab, y = 'Layer Similarity'))



# Patchwork ---------------------------------------------------------------
layout <- 'AABBCC
           DDDDDE
           FFFFFF'

(g <- gprop / gstr / gsim + 
   plot_layout(#design = layout,
               guides = 'collect')
)


# Output ------------------------------------------------------------------
ggsave('graphics/figure-4.png',
       g, width = 10, height = 10)

# ggsave('graphics/supp-count-lc.png',
#        gcount, width = 5, height = 5)
