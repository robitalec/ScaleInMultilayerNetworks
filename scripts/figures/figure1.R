
library(ggplot2)
library(ggforce)

install.packages("remotes")
remotes::install_github("sckott/rphylopic")

library(rphylopic)

df_hyaena <- data.frame(x = c(4.25, 1, 0.5, 2.5, 9), y = c(2.75, 1, 5.5, 0, 7), 
                 family = c("Association", "Aggression", "Vocal", "Scent",
                            "Range overlap"))

## select phylopic  
hyeana <- rphylopic::image_data('f1b665ae-8fe9-42e4-b03a-4e9ae8213244', 512)[[1]]


ggplot() +
  geom_ellipse(aes(x0 = 4.25, y0 = 2.75, a = 4, b = 1.5, angle = 0.5), alpha = 0.75, fill = "#d73027") + ## assoc
  geom_ellipse(aes(x0 = 1, y0 = 1, a = 1.5, b = 1.5, angle = 0), alpha = 0.75, fill = "#fee090") + ## inter
  geom_ellipse(aes(x0 = 0.5, y0 = 5.5, a = 0.75, b = 4, angle = 0), alpha = 0.75, fill = "#fc8d59") + ## vocal
  geom_ellipse(aes(x0 = 2.5, y0 = 0, a = 3, b = 0.5, angle = 0), alpha = 0.75, fill = "#4575b4") + ## scent
  geom_ellipse(aes(x0 = 9, y0 = 7, a = 3, b = 3, angle = 0.5), alpha = 0.75, fill = "#5ab4ac") + ## HRO
  geom_text(data = df_hyaena, aes(x, y, label = family)) +
  add_phylopic(hyeana, 1, y = 11, x = 11, ysize = 2) +
  ylab("") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 12), breaks=c(0, 2.5, 5, 7.5, 10), 
                     labels= c("1 Second", "1 Minute",
                             "1 Hour", "1 Day", "1 Month")) +
  scale_y_continuous(limit = c(-1, 12), breaks=c(0, 2.5, 5, 7.5, 10), 
                     labels= c("1m", "10m",
                               "100m", "1000m", "10000m")) +
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
