
library(ggplot2)
library(ggforce)
library(gridExtra)

install.packages("remotes")
remotes::install_github("sckott/rphylopic")

library(rphylopic)

## select phylopic  
hyeana <- rphylopic::image_data('f1b665ae-8fe9-42e4-b03a-4e9ae8213244', 512)[[1]]
bird <- rphylopic::image_data('dfdfb59e-8126-44e1-a7a9-1bf698113e1c', 512)[[1]]

df_hyaena <- data.frame(x = c(4.25, 1, 0.5, 2.5, 7), y = c(10, 2.5, 50, 1, 500), 
                 family = c("Association", "Aggression", "Vocal", "Scent",
                            "Range overlap"))

df_bird <- data.frame(x = c(3, 3, 1, 0.5, 8), y = c(4, 20, 1, 50, 125), 
                        family = c("Co-occurrence", "Flocking" ,"Aggression", "Vocal", 
                                   "Range overlap"))

png("graphics/figure1.png", width = 6000, height = 3000, units = "px", res = 500)
aa <- ggplot() +
  geom_ellipse(aes(x0 = 4.25, y0 = 10, a = 4, b = 1.5, angle = 0.5), 
               alpha = 0.75, fill = "#d73027") + ## assoc
  geom_ellipse(aes(x0 = 1, y0 = 2.5, a = 1.5, b = 1.5, angle = 0), 
               alpha = 0.75, fill = "#fee090") + ## inter
  geom_ellipse(aes(x0 = 0.5, y0 = 50, a = 0.75, b = 4, angle = 0), 
               alpha = 0.75, fill = "#fc8d59") + ## vocal
  geom_ellipse(aes(x0 = 2.5, y0 = 1, a = 3, b = 0.5, angle = 0), 
               alpha = 0.75, fill = "#4575b4") + ## scent
  geom_ellipse(aes(x0 = 9, y0 = 500, a = 5, b = 2, angle = 0.75), 
               alpha = 0.75, fill = "#5ab4ac") + ## HRO
  geom_text(data = df_hyaena, aes(x, y, label = family)) +
  add_phylopic(hyeana, 1, y = 12, x = 1, ysize = 2) +
  ylab("Spatial scale") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("1 Second", "1 Minute",
                             "1 Hour", "1 Day", "1 Month", "1 Year")) +
  scale_y_continuous(limits = c(0.5, 10000), trans = log2_trans(),
                     breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log10", math_format(10^.x))) +
  coord_fixed() +
  theme(
    legend.position = 'none',
    axis.text.x = element_text(size = 14, color = "black", angle = 45, vjust = 0.65),
    axis.text.y = element_text(size = 14, color = "black"),
    axis.title = element_text(size = 18),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 1))

bb <- ggplot() +
  geom_ellipse(aes(x0 = 3, y0 = 4, a = 3, b = 1.5, angle = 0.75), 
               alpha = 0.75, fill = "#d73027") + ## assoc
  geom_ellipse(aes(x0 = 3, y0 = 20, a = 1.5, b = 3, angle = 0), 
               alpha = 0.75, fill = "#998ec3") + ## Flocking
  geom_ellipse(aes(x0 = 1, y0 = 1, a = 1, b = 1, angle = 0), 
               alpha = 0.75, fill = "#fee090") + ## inter
  geom_ellipse(aes(x0 = 0.5, y0 = 50, a = 0.75, b = 4, angle = 0), 
               alpha = 0.75, fill = "#fc8d59") + ## vocal
  geom_ellipse(aes(x0 = 8, y0 = 125, a = 6, b = 2, angle = 0.75), 
               alpha = 0.75, fill = "#5ab4ac") + ## HRO
  geom_text(data = df_bird, aes(x, y, label = family)) +
  add_phylopic(bird, 1, y = 12, x = 1, ysize = 2) +
  ylab("Spatial scale") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("1 Second", "1 Minute",
                               "1 Hour", "1 Day", "1 Month", "1 Year")) +
  scale_y_continuous(limits = c(0.5, 10000), 
                     trans = log2_trans(),
                     breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log10", math_format(10^.x))) +
  coord_fixed() +
  theme(
    legend.position = 'none',
    axis.text.x = element_text(size = 14, color = "black", angle = 45, vjust = 0.65),
    axis.text.y = element_text(size = 14, color = "black"),
    axis.title = element_text(size = 18),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 1))
grid.arrange(aa, bb, ncol = 2)
dev.off()