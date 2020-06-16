# === Global Plot Theme ---------------------------------------------------
# Alec Robitaille

library(ggplot2)


# Theme -------------------------------------------------------------------
base <- 
  theme(
    legend.text = element_text(size = 12, color = 'black'),
    legend.title = element_blank(),
    legend.spacing = unit(-0.5, 'cm'),
    legend.background = element_blank(),
    legend.key = element_blank(),
    axis.text.x = element_text(
      size = 12,
      color = 'black',
      vjust = 0.65
    ),
    axis.text.y = element_text(size = 14, color = 'black'),
    axis.title = element_text(size = 18),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    panel.border = element_rect(
      colour = 'black',
      fill = NA,
      size = 1
    ),
    strip.background = element_rect(fill = NA, color = 'black')
)



# Linesize ----------------------------------------------------------------
linesize <- 1.3



# Colors ------------------------------------------------------------------
lccolors <- c('#fdc086', '#7fc97f', '#beaed4')
# lccolors <- scales::viridis_pal(alpha = 1, option = 'E')(5)[c(1, 3, 4)]
  # scales::viridis_pal(alpha = 0.7)(4)[1:3]
names(lccolors) <- c('Open', 'Forest', 'Forage')
lcvalcolors <- lccolors
names(lcvalcolors) <-c(1, 2, 3)

cols <- c('winter' = '#8c510a', 'summer' = '#5ab4ac')
greys <- c(`1` = '#6b6b6b', `2` = '#c2c2c2', `3` = '#919191')