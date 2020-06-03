# Theme
p <- theme(legend.text = element_text(size = 12, color = "black"),
           legend.title = element_blank(),
           legend.spacing = unit(-0.5, 'cm'),
           legend.background = element_blank(),
           legend.key = element_blank(),
           axis.text.x = element_text(size = 14, color = "black", vjust = 0.65),
           axis.text.y = element_text(size = 14, color = "black"),
           axis.title = element_text(size = 18),
           panel.grid.minor = element_blank(),
           panel.background = element_blank(),
           panel.border = element_rect(
             colour = "black",
             fill = NA,
             size = 1))
