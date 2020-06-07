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
  # guides(color = FALSE) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Edge Overlap') + 
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



# Patchwork ---------------------------------------------------------------
layout <- 'AABBCC
           DDDDDE
           FFFFFF'

(g <- gprop + guide_area() + gstr +
   plot_layout(design = layout,
               guides = 'collect')
)


# Edge overlap matrix -----------------------------------------------------
mat <- eovr$edgeoverlapmat[[1]]
zzz <- data.table(mat, keep.rownames = 'layer')
zzz[, layer := as.integer(layer)]
setcolorder(zzz, c('layer', as.character(sort(as.integer(colnames(zzz))))))
setorder(zzz, layer)


x <- melt(zzz, id.vars = 'layer', variable.name = 'leftlayer', variable.factor = FALSE)
x[, leftlayer := as.integer(leftlayer)]
x[leftlayer > as.integer(layer), value := NA]
ggplot(x) + 
  geom_tile(aes(layer, sort(leftlayer), fill = value))


# Output ------------------------------------------------------------------
# ggsave('graphics/figure-3.png',
#        g, width = 10, height = 10)

# ggsave('graphics/supp-count-lc.png',
#        gcount, width = 5, height = 5)
