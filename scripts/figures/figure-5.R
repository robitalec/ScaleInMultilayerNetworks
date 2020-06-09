# === Figure 5 ------------------------------------------------------------
# Spatial Distance Threshold
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
DT <- readRDS('data/derived-data/04-spatial-threshold.Rds')
netDT <- readRDS('data/derived-data/04-spatial-threshold-fig-data.Rds')


# Theme -------------------------------------------------------------------
source('scripts/figures/theme.R')



# Plot --------------------------------------------------------------------
xlab <- 'Social Distance Threshold'

# DT[, middate := mean(c(mindate, maxdate)), layer]

DT[, meangraphstrength := mean(graphstrength), layer]

# Edge overlap
gprop <- ggplot(DT) + 
  geom_line(aes(x = spatialthreshold, y = propedges),
            size = 2) + 
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Edge Overlap') + 
  ylim(0, 1) +
  scale_x_continuous(expand = c(0, 0))



# Graph strength
gstr <- ggplot(DT) +
  geom_line(aes(x = spatialthreshold, y = propedges),
            size = 0.5, alpha = 0.3) + 
  geom_line(aes(x = spatialthreshold, y = propedges),
            size = 2) + 
  guides(color = FALSE) +
  base +
  labs(x = xlab, y = 'Graph Strength') +
  scale_x_continuous(expand = c(0, 0))


# Layer similarity
gsim <- ggplot(DT) +
  geom_line(aes(x = spatialthreshold, y = layersim)) +
  guides(color = FALSE) +
  base +
  labs(x = xlab, y = 'Layer Similarity') +
  scale_x_continuous(expand = c(0, 0))

# Network
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
  theme(strip.background = element_blank(),
        strip.text = element_blank())

# Number of individuals
(gnid <- ggplot(unique(DT[, .(middate, mindate, maxdate, nid)])) +
    geom_line(aes(x = middate, nid), size = 1) + 
    geom_segment(aes(x = mindate, xend = maxdate, 
                     y = nid, yend = nid),
                 size = 0.5) + 
    guides(color = FALSE) +
    base +
    labs(x = xlab, y = 'Number of Individuals'))


# Patchwork ---------------------------------------------------------------
layout <- 'A
           A
           B
           C
           C'


(g <- gprop / gnn / gstr + 
   plot_layout(design = layout) 
)


# gsimm

# Output ------------------------------------------------------------------
ggsave('graphics/figure-4.png',
       g, width = 13, height = 10)

ggsave('graphics/supp-temp-nid.png',
       gnid, width = 5, height = 5)
