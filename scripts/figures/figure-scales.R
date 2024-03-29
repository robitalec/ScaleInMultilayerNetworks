# === Figure 1 ------------------------------------------------------------
# Quinn MR Webber, Julie Turner

# Packages ----------------------------------------------------------------
library(data.table)
library(ggplot2)
library(ggforce)
library(gridExtra)
library(remotes)
library(scales)

# remotes::install_github("sckott/rphylopic")
library(rphylopic)



# Input -------------------------------------------------------------------
# Select phylopic
hyeana <- image_data('f1b665ae-8fe9-42e4-b03a-4e9ae8213244', 512)[[1]]
bird <- image_data('dfdfb59e-8126-44e1-a7a9-1bf698113e1c', 512)[[1]]
lizard <- image_data('83ba27dd-ad53-45e4-acf4-d75bf74105a6', 512)[[1]]
elephant <- image_data('fb84ef24-5eb8-4fb7-bf36-d20ebbfdd125', 512)[[1]] 

# Load coordinate data for ellipses
df <- fread("data/raw-data/figure1.csv")


# Colors ------------------------------------------------------------------
assoc <- "#d73027"
inter <- "#fee090"
voc <- "#fc8d59"
scent <- "#4575b4"
hro <- "#5ab4ac"


# Theme -------------------------------------------------------------------
p <- theme(legend.position = 'none',
            axis.text.x = element_text(size = 14, color = "black", angle = 45, vjust = 0.65),
            axis.text.y = element_text(size = 14, color = "black"),
            axis.title = element_text(size = 18),
            panel.grid.minor = element_blank(),
            panel.background = element_blank(),
            panel.border = element_rect(
                                        colour = "black",
                                        fill = NA,
                                        size = 1))


# Variables ---------------------------------------------------------------
# silhouette size
ysize = 5 



# Figure ------------------------------------------------------------------
png("graphics/figure-scales.png", width = 6000, height = 6000, units = "px", res = 500)
aa <- ggplot() +
  geom_ellipse(data = df[species == "hyeana" & behaviour == "Association"], 
               aes(x0 = x, y0 = y, a = 7, b = 3.25, angle = 1.2), 
               alpha = 0.75, fill = assoc) +  
  geom_ellipse(data = df[species == "hyeana" & behaviour == "Interaction"],
               aes(x0 = x, y0 = y, a = 1.25, b = 3.25, angle = 0), 
               alpha = 0.75, fill = inter) +
  geom_ellipse(data = df[species == "hyeana" & behaviour == "Vocal"],
               aes(x0 = x, y0 = y, a = 0.75, b = 9.5, angle = 0), 
               alpha = 0.75, fill = voc) + 
  geom_ellipse(data = df[species == "hyeana" & behaviour == "Scent"],
               aes(x0 = x, y0 = y, a = 3, b = 1, angle = 0), 
               alpha = 0.75, fill = scent ) + 
  geom_ellipse(data = df[species == "hyeana" & behaviour == "Home range overlap"],
               aes(x0 = x, y0 = y, a = 2.5, b = 14, angle = 0), 
               alpha = 0.75, fill = hro) + 
  geom_text(data = df[species == "hyeana"], aes(x, y, label = behaviour),
            fontface = "bold") +
  add_phylopic(hyeana, 1, y = 30, x = 1, ysize = ysize) +
  ylab("Relative spatial scale") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("Seconds", "Minutes",
                             "Hours", "Days", "Months", "Years")) +
  scale_y_continuous(limits = c(0.5, 10000000000), trans = log2_trans(),
                     breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log10", math_format(10^.x))) +
  p
  

bb <- ggplot() +
  geom_ellipse(data = df[species == "bird" & behaviour == "Association"], 
               aes(x0 = x, y0 = y, a = 4, b = 3.25, angle = 0.5), 
               alpha = 0.75, fill = assoc) +  
  geom_ellipse(data = df[species == "bird" & behaviour == "Interaction"],
               aes(x0 = x, y0 = y, a = 1.25, b = 3.25, angle = 0), 
               alpha = 0.75, fill = inter) + 
  geom_ellipse(data = df[species == "bird" & behaviour == "Vocal"],
               aes(x0 = x, y0 = y, a = 0.75, b = 7, angle = 0), 
               alpha = 0.75, fill = voc) + 
  geom_ellipse(data = df[species == "bird" & behaviour == "Home range overlap"],
               aes(x0 = x, y0 = y, a = 3, b = 7, angle = 0), 
               alpha = 0.75, fill = hro) + 
  geom_text(data = df[species == "bird"], aes(x, y, label = behaviour),
            fontface = "bold") +
  add_phylopic(bird, 1, y = 30, x = 1, ysize = ysize) +
  ylab("") +
  xlab("") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("Seconds", "Minutes",
                               "Hours", "Days", "Months", "Years")) +
  scale_y_continuous(limits = c(0.25, 10000000000), 
                     trans = log2_trans(),
                     breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log10", math_format(10^.x))) +
  p

cc <- ggplot() +
  geom_ellipse(data = df[species == "lizard" & behaviour == "Association"], 
               aes(x0 = x, y0 = y, a = 4, b = 3.25, angle = 0.5), 
               alpha = 0.75, fill = assoc) +  
  geom_ellipse(data = df[species == "lizard" & behaviour == "Interaction"],
               aes(x0 = x, y0 = y, a = 1.5, b = 3.25, angle = 0), 
               alpha = 0.75, fill = inter) + 
  geom_ellipse(data = df[species == "lizard" & behaviour == "Scent"],
               aes(x0 = x, y0 = y, a = 4.5, b = 0.75, angle = 0), 
               alpha = 0.75, fill = scent) + 
  geom_ellipse(data = df[species == "lizard" & behaviour == "Home range overlap"],
               aes(x0 = x, y0 = y, a = 2.5, b = 11.5, angle = 0), 
               alpha = 0.75, fill = hro) + 
  geom_text(data = df[species == "lizard"], aes(x, y, label = behaviour),
            fontface = "bold") +
  add_phylopic(lizard, 1, y = 30, x = 1, ysize = 4) +
  ylab("Relative spatial scale") +
  xlab("Relative time scale") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("Seconds", "Minutes",
                               "Hours", "Days", "Months", "Years")) +
  scale_y_continuous(limits = c(0.25, 10000000000), 
                     trans = log2_trans(),
                     breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log10", math_format(10^.x))) +
  p

dd <- ggplot() +
  geom_ellipse(data = df[species == "elephant" & behaviour == "Association"], 
               aes(x0 = x, y0 = y, a = 5.5, b = 4, angle = 0.75), 
               alpha = 0.75, fill = assoc) +  
  geom_ellipse(data = df[species == "elephant" & behaviour == "Interaction"],
               aes(x0 = x, y0 = y, a = 1.5, b = 3.25, angle = 0), 
               alpha = 0.75, fill = inter) + 
  geom_ellipse(data = df[species == "elephant" & behaviour == "Scent"],
               aes(x0 = x, y0 = y, a = 3, b = 2, angle = 0), 
               alpha = 0.75, fill = scent) + 
  geom_ellipse(data = df[species == "elephant" & behaviour == "Home range overlap"],
               aes(x0 = x, y0 = y, a = 2.5, b = 16, angle = 0), 
               alpha = 0.75, fill = hro) + 
  geom_ellipse(data = df[species == "elephant" & behaviour == "Vocal"],
               aes(x0 = x, y0 = y, a = 0.75, b = 14, angle = 0), 
               alpha = 0.75, fill = voc) + 
  geom_text(data = df[species == "elephant"], aes(x, y, label = behaviour),
            fontface = "bold") +
  add_phylopic(elephant, 1, y = 30, x = 1, ysize = 7) +
  ylab("") +
  xlab("Relative time scale") +
  scale_x_continuous(limit = c(-1, 14), breaks=c(0, 2.5, 5, 7.5, 10, 12.5), 
                     labels= c("Seconds", "Minutes",
                               "Hours", "Days", "Months", "Years")) +
  scale_y_continuous(limits = c(0.25, 10000000000), 
                     trans = log2_trans(),
                     breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log10", math_format(10^.x))) +
  p

grid.arrange(aa, bb, cc, dd, nrow = 2, ncol = 2)

dev.off()