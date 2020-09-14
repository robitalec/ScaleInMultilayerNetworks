# === Figure 3 ------------------------------------------------------------
# Fogo Caribou Multilayer Network
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'patchwork',
          'ggnetwork',
          'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/06-fogo-ml.Rds')
netDT <- readRDS('data/derived-data/06-fogo-ml-network-fig-data.Rds')


# Theme -------------------------------------------------------------------
if(interactive()) {
  source('scripts/figures/theme.R')
}



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
    guides(color = FALSE) +
    facet_wrap(~lcname) + 
    scale_color_manual(values = lccolors) + 
    base +
    labs(x = xlab, y = 'splitNeigh')
)

# Network
netDT[DT, middate := middate, on = 'season']

mat <- matrix(c(3,1,0,1),2,2)
shear_xy(netDT, c('xend', 'yend'), shearmatrix = mat)
netDT[, c('shearxend', 'shearyend') := .(shearx, sheary)]
shear_xy(netDT, c('x', 'y'), shearmatrix = mat)

push <- 0.1
box <- netDT[, CJ(x = c(max(x), min(x)), y = c(max(y), min(y)))]
shear_xy(box, c('x', 'y'), shearmatrix = mat)
box[, c('shearx', 'sheary') := .(shearx + c(-push, -push, push, push),
                                 sheary + c(-push, push, -push, push))]
box[, ord := rep(c(1, 2, 4, 3), length.out = .N)]
box <- box[rep(seq.int(.N), times = netDT[, uniqueN(lcname)])]
box[, lcname := netDT[, rep(unique(lcname), each = 4)]]

nodesize <- 3
(gnn <- ggplot(
  netDT,
  aes(
    x = shearx,
    y = sheary)
) +
  geom_polygon(data = box[order(ord)], alpha = 0.5, 
               aes(fill = lcname)) + 
  geom_edges(aes(xend = shearxend,
                 yend = shearyend,
                 size = weight),
             alpha = 0.8
  ) +
  facet_grid(lcname ~ season, switch = 'both') +
  guides(fill = FALSE, size = FALSE) +
  geom_nodes(size = nodesize) +
  geom_nodes(aes(shearxend, shearyend), size = nodesize) +
  scale_size_area(max_size = 1) + 
  scale_fill_manual(values = lccolors) + 
  theme_blank() +
  theme(axis.title.x = element_text(size = 14), 
        strip.background = element_rect(fill = NA, color = NA),
        strip.text = element_text(size = 14),
        panel.spacing = unit(0, "lines")) +
    xlab('Time Window')
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


# Output ------------------------------------------------------------------
ggsave('graphics/figure-fogo-ml.png',
       gnn, width = 10, height = 9)