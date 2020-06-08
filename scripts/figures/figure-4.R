# === Figure 3 ------------------------------------------------------------
# Temporal Layers
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'patchwork',
          'raster',
          'rasterVis',
          'ggnetwork')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/03-temporal-layers.Rds')
netDT <- readRDS('data/derived-data/03-temporal-network-fig-data.Rds')


# Theme -------------------------------------------------------------------
source('scripts/figures/theme.R')



# Plot --------------------------------------------------------------------
xlab <- 'temporal cut'



(gprop <- ggplot(DT) + 
  geom_segment(aes(x = mindate, xend = maxdate, 
                   y = propedges, yend = propedges),
            size = 2) + 
  scale_color_manual(values = lccolors) +
  base +
  labs(x = xlab, y = 'Edge Overlap') + 
  ylim(0, 1) +
  scale_x_date(expand = c(0, 0))
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

gnn <- ggplot(
  netDT,
  aes(
    x = x,
    y = y)
) +
    geom_edges(aes(xend = xend,
                   yend = yend),
               size = 0.2
    ) +
    facet_grid(cols = vars(layerfctr)) + 
    guides(color = FALSE, size = FALSE) +
    geom_nodes() +
    geom_nodes(aes(xend, yend)) +
    theme_blank() + 
    theme(
          strip.background = element_blank(),
          strip.text = element_blank())

gnid <- ggplot(DT) + 
  geom_point(aes(middate, nid)) +
  base


# Patchwork ---------------------------------------------------------------
layout <- 'A
           A
           B'


(g <- gprop / gnn + 
   plot_layout(design = layout,
               guides = 'collect') #+
   # plot_annotation(theme = theme(plot.margin = unit(c(0, 100, 0, 100), "pt")))
)


# gsimm
# gnid


# Output ------------------------------------------------------------------
ggsave('graphics/figure-4.png',
       g, width = 13, height = 10)

# ggsave('graphics/supp-count-lc.png',
#        gcount, width = 5, height = 5)
