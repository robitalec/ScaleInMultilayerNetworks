
library(data.table)
library(ggplot2)
library(ggforce)
library(gridExtra)
library(remotes)
library(scales)

remotes::install_github("sckott/rphylopic")
library(rphylopic)

## select phylopic  
hyeana <- rphylopic::image_data('f1b665ae-8fe9-42e4-b03a-4e9ae8213244', 512)[[1]]
bird <- rphylopic::image_data('dfdfb59e-8126-44e1-a7a9-1bf698113e1c', 512)[[1]]
lizard <- rphylopic::image_data('83ba27dd-ad53-45e4-acf4-d75bf74105a6', 512)[[1]]

## load coordinate data for ellipses
df <- fread("data/raw-data/figure1.csv")

## assign colors
assoc <- "#d73027"
inter <- "#fee090"
voc <- "#fc8d59"
scent <- "#4575b4"
hro <- "#5ab4ac"

#png("graphics/figure1.png", width = 6000, height = 3000, units = "px", res = 500)
aa <- ggplot() +
  geom_ellipse(data = df[species == "hyeana" & behaviour == "association"], 
               aes(x0 = x, y0 = y, a = 4, b = 1.5, angle = 0.5), 
               alpha = 0.75, fill = assoc) +  
  geom_ellipse(data = df[species == "hyeana" & behaviour == "interaction"],
               aes(x0 = x, y0 = y, a = 1.5, b = 1.5, angle = 0), 
               alpha = 0.75, fill = inter) +
  geom_ellipse(data = df[species == "hyeana" & behaviour == "vocal"],
               aes(x0 = x, y0 = y, a = 0.75, b = 4, angle = 0), 
               alpha = 0.75, fill = voc) + 
  geom_ellipse(data = df[species == "hyeana" & behaviour == "scent"],
               aes(x0 = x, y0 = y, a = 3, b = 0.5, angle = 0), 
               alpha = 0.75, fill = scent ) + 
  geom_ellipse(data = df[species == "hyeana" & behaviour == "hro"],
               aes(x0 = x, y0 = y, a = 2, b = 5, angle = 0), 
               alpha = 0.75, fill = hro) + 
  geom_text(data = df[species == "hyena"], aes(x, y, label = behaviour)) +
  add_phylopic(hyeana, 1, y = 30, x = 1, ysize = 2) +
  ylab("Spatial scale") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("1 Second", "1 Minute",
                             "1 Hour", "1 Day", "1 Month", "1 Year")) +
  scale_y_continuous(limits = c(0.5, 10000000000), trans = log2_trans(),
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
  geom_ellipse(data = df[species == "bird" & behaviour == "association"], 
               aes(x0 = x, y0 = y, a = 4, b = 1.5, angle = 0.5), 
               alpha = 0.75, fill = "#d73027") +  ## assoc
  geom_ellipse(data = df[species == "bird" & behaviour == "interaction"],
               aes(x0 = x, y0 = y, a = 1.5, b = 1.5, angle = 0), 
               alpha = 0.75, fill = "#fee090") + ## inter
  geom_ellipse(data = df[species == "bird" & behaviour == "vocal"],
               aes(x0 = x, y0 = y, a = 0.75, b = 4, angle = 0), 
               alpha = 0.75, fill = "#fc8d59") + ## vocal
  geom_ellipse(data = df[species == "bird" & behaviour == "flocking"],
               aes(x0 = x, y0 = y, a = 3, b = 0.5, angle = 0), 
               alpha = 0.75, fill = "#4575b4") + ## scent
  geom_ellipse(data = df[species == "bird" & behaviour == "hro"],
               aes(x0 = x, y0 = y, a = 2, b = 5, angle = 0.1), 
               alpha = 0.75, fill = "#5ab4ac") + ## HRO
  geom_text(data = df[species == "hyena"], aes(x, y, label = behaviour)) +
  add_phylopic(bird, 1, y = 30, x = 1, ysize = 2) +
  ylab("Spatial scale") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("1 Second", "1 Minute",
                               "1 Hour", "1 Day", "1 Month", "1 Year")) +
  scale_y_continuous(limits = c(0.25, 10000000000), 
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
ggplot() +
  geom_ellipse(data = df[species == "lizard" & behaviour == "association"], 
               aes(x0 = x, y0 = y, a = 4, b = 1.5, angle = 0.5), 
               alpha = 0.75, fill = assoc) +  
  geom_ellipse(data = df[species == "lizard" & behaviour == "interaction"],
               aes(x0 = x, y0 = y, a = 1.5, b = 1.5, angle = 0), 
               alpha = 0.75, fill = inter) + 
  geom_ellipse(data = df[species == "lizard" & behaviour == "scent"],
               aes(x0 = x, y0 = y, a = 0.75, b = 4, angle = 0), 
               alpha = 0.75, fill = scent) + 
  geom_ellipse(data = df[species == "lizard" & behaviour == "hro"],
               aes(x0 = x, y0 = y, a = 2, b = 5, angle = 0.1), 
               alpha = 0.75, fill = hro) + 
  geom_text(data = df[species == "lizard"], aes(x, y, label = behaviour)) +
  add_phylopic(lizard, 1, y = 30, x = 1, ysize = 2) +
  ylab("Spatial scale") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("1 Second", "1 Minute",
                               "1 Hour", "1 Day", "1 Month", "1 Year")) +
  scale_y_continuous(limits = c(0.25, 10000000000), 
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