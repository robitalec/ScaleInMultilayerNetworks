# === Figure 3 ------------------------------------------------------------
# Temporal Layers
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'patchwork',
          'ggnetwork')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/03-temporal-layers.Rds')
netDT <- readRDS('data/derived-data/03-temporal-network-fig-data.Rds')


# Theme -------------------------------------------------------------------
# source('scripts/figures/theme.R')



# Plot --------------------------------------------------------------------
xlab <- 'Date'

DT[, middate := mean(c(mindate, maxdate)), layer]

DT[, meangraphstrength := mean(graphstrength), by = timecut]

# Edge overlap
gprop <- ggplot(DT) + 
  geom_segment(aes(x = mindate, xend = maxdate, 
                   y = propedges, yend = propedges),
               size = 2) + 
  geom_line(aes(x = middate, y = propedges)) + 
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Edge Overlap', subtitle = 'A)') + 
  ylim(0, 1) +
  scale_x_date(expand = c(0, 0), breaks = scales::pretty_breaks(n = 10))



# Graph strength
gstr <- ggplot(DT) +
  geom_segment(aes(x = mindate, xend = maxdate,
                   y = graphstrength, yend = graphstrength),
               size = 0.5, alpha = 0.3) +
  geom_segment(aes(x = mindate, xend = maxdate, 
                   y = meangraphstrength, yend = meangraphstrength),
               size = 2) +
  geom_line(aes(x = middate, y = meangraphstrength)) + 
  guides(color = FALSE) +
  base +
  labs(x = xlab, y = 'Graph Strength', subtitle = 'C)') +
  scale_x_date(expand = c(0, 0), breaks = scales::pretty_breaks(n = 10))


# Layer similarity
# gsim <- ggplot(DT) +
#     geom_line(aes(x = middate, layersim)) + 
#     geom_segment(aes(x = mindate, xend = maxdate, 
#                      y = layersim, yend = layersim),
#                  size = 0.5, alpha = 0.3) + 
#     guides(color = FALSE) +
#     base +
#     labs(x = xlab, y = 'Layer Similarity') +
#   scale_x_date(expand = c(0, 0), breaks = scales::pretty_breaks(n = 10))

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
          strip.text = element_blank()) + 
    labs(subtitle = 'B)')

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
ggsave('graphics/figure-temp.png',
       g, width = 13, height = 10)

ggsave('graphics/supp-temp-nid.png',
       gnid, width = 5, height = 5)
