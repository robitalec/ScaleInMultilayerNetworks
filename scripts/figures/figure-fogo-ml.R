# === Figure 3 ------------------------------------------------------------
# Fogo Caribou Multilayer Network
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'patchwork',
          'ggnetwork')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/07-fogo-ml.Rds')
netDT <- readRDS('data/derived-data/07-fogo-ml-network-fig-data.Rds')


# Theme -------------------------------------------------------------------
source('scripts/figures/theme.R')



# Plot --------------------------------------------------------------------
xlab <- 'Season'

DT[, middate := mean(c(seasonstart, seasonend)), layer]

DT[, meangraphstrength := mean(graphstrength), by = layer]

netDT[, c('season', 'lcname') := tstrsplit(layer, '-', type.convert = TRUE)]

# Edge overlap
(gprop <- ggplot(DT) + 
  geom_segment(aes(x = seasonstart, xend = seasonend,
                   y = propedges, yend = propedges),
               size = 0.5, alpha = 0.3) +
  geom_line(aes(x = middate, y = propedges, color = lcname),
               size = 2, alpha = 0.5) + 
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Edge Overlap') + 
  ylim(0, 1) +
  scale_x_date(expand = c(0, 0)))



# Graph strength
(gstr <- ggplot(DT, aes(color = lcname)) +
  geom_segment(aes(x = seasonstart, xend = seasonend,
                   y = graphstrength, yend = graphstrength),
               size = 0.5, alpha = 0.3) +
  geom_segment(aes(x = seasonstart, xend = seasonend, 
                   y = meangraphstrength, yend = meangraphstrength),
               size = 2) +
  geom_line(aes(x = middate, y = meangraphstrength)) + 
  guides(color = FALSE) +
    facet_wrap(~lcname) + 
    scale_color_manual(values = lccolors) + 
  base +
  labs(x = xlab, y = 'Graph Strength') +
  scale_x_date(expand = c(0, 0))
)

(gdeg <- ggplot(DT, aes(color = lcname)) +
    geom_line(aes(x = middate, y = splitNeigh, group = ANIMAL_ID),
                 size = 0.5, alpha = 0.3) +
    # geom_segment(aes(x = seasonstart, xend = seasonend, 
    #                  y = meangraphstrength, yend = meangraphstrength),
    #              size = 2) +
    # geom_line(aes(x = middate, y = meangraphstrength)) + 
    guides(color = FALSE) +
    facet_wrap(~lcname) + 
    scale_color_manual(values = lccolors) + 
    base +
    labs(x = xlab, y = 'splitNeigh')
)

# Layer similarity
# gsim <- ggplot(DT) +
#   geom_line(aes(x = middate, layersim)) + 
#   geom_segment(aes(x = seasonstart, xend = seasonend, 
#                    y = layersim, yend = layersim),
#                size = 0.5, alpha = 0.3) + 
#   guides(color = FALSE) +
#   base +
#   labs(x = xlab, y = 'Layer Similarity') +
#   scale_x_date(expand = c(0, 0))

# Network
(gnn <- ggplot(
  netDT,
  aes(
    x = x,
    y = y,
    color = lcname)
) +
  geom_edges(aes(xend = xend,
                 yend = yend,
                 size = weight),
             alpha = 0.8
  ) +
  facet_grid(lcname ~ season) + 
  guides(color = FALSE, size = FALSE) +
  geom_nodes() +
  scale_size_area(max_size = 1) + 
    scale_color_manual(values = lccolors) + 
  geom_nodes(aes(xend, yend)) +
  theme_blank() + 
  theme(strip.background = element_blank(),
        strip.text = element_blank())
)

# Number of individuals
(gnid <- ggplot(unique(DT[, .(middate, seasonstart, seasonend, nid)])) +
    geom_line(aes(x = middate, nid), size = 1) + 
    geom_segment(aes(x = seasonstart, xend = seasonend, 
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
ggsave('graphics/figure-fogo-ml.png',
       g, width = 13, height = 10)

# ggsave('graphics/supp-temp-nid.png',
#        gnid, width = 5, height = 5)
