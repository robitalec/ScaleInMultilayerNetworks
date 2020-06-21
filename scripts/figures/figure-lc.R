# === Figure: Land Cover Resolution ---------------------------------------
# Land Cover Resolution
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'ggplot2', 'patchwork', 'raster', 'rasterVis')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/02-landcover-scale.Rds')
count <- readRDS('data/derived-data/02-landcover-scale-count.Rds')


legend <- data.table(lc = c(1, 2, 3),
                     lcname = c('Open', 'Forest', 'Foraging'))

DT[legend, lcname := lcname, on = 'lc']
count[legend, lcname := lcname, on = 'lc']

lc30 <- readRDS('data/derived-data/01-reclass-lc.Rds')
lc500 <- raster('data/derived-data/02-landcover-res-500.tif')
lc1000 <- raster('data/derived-data/02-landcover-res-1000.tif')


# Theme -------------------------------------------------------------------
if(interactive()) {
  source('scripts/figures/theme.R')
}

themelc <- theme(
  panel.border = element_rect(size = 1, fill = NA),
  panel.background = element_rect(fill = '#e1f0f5'),
  panel.grid = element_line(color = 'grey', size = 0.2),
  axis.text = element_blank(),
  axis.ticks = element_blank(),
  axis.title = element_blank()
)


# Plot --------------------------------------------------------------------
count[lc %in% c(1, 2, 3), 
      percent := N / sum(N) * 100, by = res]

DT[, meangraphstrength := mean(graphstrength, na.rm = TRUE),
   by = .(lcname, lcres)]


xlab <- 'Land Cover Spatial Resolution'



gcount <- ggplot(count[lc %in% c(1, 2, 3)]) + 
  geom_line(aes(res, percent, 
                color = lcname),
            size = 2) + 
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Proportion of Relocations')

gprop <- ggplot(DT) + 
  geom_line(aes(lcres, propedges, 
                color = lcname),
            size = 2) + 
  # guides(color = FALSE) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Edge Overlap', subtitle = 'A)')
  

gstr <- ggplot(DT) +
  geom_line(aes(lcres, graphstrength, group = ANIMAL_ID, color = lcname),
            alpha = 0.3, size = 1.2) +
  geom_line(aes(lcres, meangraphstrength, color = lcname),
            size = 2) +
  facet_grid( ~ lcname) +
  guides(color = FALSE) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Graph Strength', subtitle = 'B)') + 
  theme(panel.spacing = unit(1, "lines"))


g30 <- gplot(lc30) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = lcvalcolors) +
  labs(subtitle = 'C) 30 m') +
  themelc + 
  guides(fill = FALSE)

g500 <- gplot(lc500) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = lcvalcolors) +
  labs(subtitle = 'D) 500 m') +
  themelc + 
  guides(fill = FALSE)

g1000 <- gplot(lc1000) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = lcvalcolors) +
  labs(subtitle = 'E) 1000 m') +
  themelc + 
  guides(fill = FALSE)



# Patchwork ---------------------------------------------------------------
layout <- 'AAAAAB
           CCCCCC
           DDEEFF'

(g <- gprop + guide_area() + gstr +
   g30 + g500 + g1000 + 
   # plot_annotation(caption = xlab) +
   plot_layout(design = layout,
               guides = 'collect') + 
   plot_annotation(caption = 'Land Cover Resolution') &
   theme(plot.caption = element_text(hjust = 0.5, size = 16))
   
)



# Output ------------------------------------------------------------------
ggsave('graphics/figure-lc.png',
       g, width = 10, height = 10)

ggsave('graphics/supp-count-lc.png',
       gcount, width = 5, height = 5)