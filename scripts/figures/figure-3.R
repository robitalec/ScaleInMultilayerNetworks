# === Figure 3 ------------------------------------------------------------
# Land Cover Resolution
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'ggplot2', 'patchwork', 'raster')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/2-landcover-scale.Rds')
count <- readRDS('data/derived-data/2-landcover-scale-count.Rds')


legend <- data.table(lc = c(1, 2, 3),
                     lcname = c('open', 'forest', 'forage'))

DT[legend, lcname := lcname, on = 'lc']
count[legend, lcname := lcname, on = 'lc']



# Theme -------------------------------------------------------------------
source('scripts/figures/theme.R')

# Plot --------------------------------------------------------------------
count[lc %in% c(1, 2, 3), 
      percent := N / sum(N) * 100, by = res]

DT[, meangraphstrength := mean(graphstrength, na.rm = TRUE),
   by = .(lcname, lcres)]


xlab <- 'Land Cover Resolution'



gcount <- ggplot(count[lc %in% c(1, 2, 3)]) + 
  geom_line(aes(res, percent, 
                linetype = lcname))


gprop <- ggplot(DT) + 
  geom_line(aes(lcres, propedges, 
                linetype = lcname)) + 
  guides(linetype = FALSE)
  

gstr <- ggplot(DT) +
  geom_line(aes(lcres, graphstrength, group = ANIMAL_ID),
            alpha = 0.7,
            color = 'grey') +
  geom_line(aes(lcres, meangraphstrength)) +
  facet_grid( ~ lcname) +
  guides(color = FALSE)


layout <- 'AAA#
           BBBD
           CCC#'

(gcount / 
  gstr + guide_area() / 
  gprop & 
   scale_linetype_manual(values = linetypes) &
   labs(x = xlab)) +
  plot_layout(design = layout,
              guides = 'collect')


lc30 <- readRDS('data/derived-data/1-reclass-lc.Rds')
lc500 <- raster('data/derived-data/2-landcover-res-500.tif')
lc1000 <- raster('data/derived-data/2-landcover-res-1000.tif')

rasterVis::gplot(lc30) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = greys)

rasterVis::gplot(lc500) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = greys)

rasterVis::gplot(lc1000) + 
  geom_tile(aes(fill = factor(value))) + 
  scale_fill_manual(values = greys)

# Output ------------------------------------------------------------------



