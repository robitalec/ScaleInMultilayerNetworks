
library(ggplot2)
library(ggforce)

install.packages("remotes")
remotes::install_github("sckott/rphylopic")

df <- data.frame(x = c(4.25, 1, 0.5, 5), y = c(2.75, 1, 5.5, 0.5), 
                 family = c("Association", "Aggression", "Vocal", "Scent"))

## select phylopic  
person <- name_search(text = "Homo sapiens", options = "namebankID")[[1]]

ggplot() +
  geom_ellipse(aes(x0 = 4.25, y0 = 2.75, a = 5, b = 1.5, angle = 0.5), alpha = 0.25, fill = "blue") + ## assoc
  geom_ellipse(aes(x0 = 1, y0 = 1, a = 1, b = 1, angle = 0), alpha = 0.25, fill = "red") + ## inter
  geom_ellipse(aes(x0 = 0.5, y0 = 5.5, a = 0.5, b = 4, angle = 0), alpha = 0.25, fill = "green") + ## vocal
  geom_ellipse(aes(x0 = 5, y0 = 0.5, a = 5, b = 0.25, angle = 0), alpha = 0.25, fill = "yellow") + ## scent
  geom_text(data = df, aes(x, y, label = family)) +
  ylab("Space") +
  xlab("Time") +
  #ylim(-0.5,10) +
  #xlim(-0.5,10) +
  coord_fixed() +
  theme(
    legend.position = 'none',
    axis.text = element_blank(),
    axis.title = element_text(size = 18),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 1
    )
  )
