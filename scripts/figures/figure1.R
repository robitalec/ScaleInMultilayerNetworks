
library(ggplot2)
library(ggforce)

ggplot() +
  geom_ellipse(aes(x0 = 1, y0 = 1, a = 1, b = 1, angle = 0), alpha = 0.25, fill = "red") +
  geom_ellipse(aes(x0 = 5, y0 = 3, a = 3, b = 2, angle = 0), alpha = 0.25, fill = "blue") +
  ylim(0,10) +
  xlim(0,10) +
  coord_fixed()
