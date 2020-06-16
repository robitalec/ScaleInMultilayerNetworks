# === Figure 6 ------------------------------------------------------------
# Number of Observations
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'patchwork')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/05-number-of-observations.Rds')


legend <- data.table(lc = c(1, 2, 3),
                     lcname = c('Open', 'Forest', 'Forage'))

DT[legend, lcname := lcname, on = 'lc']


# Theme -------------------------------------------------------------------
# source('scripts/figures/theme.R')



# Plot --------------------------------------------------------------------
xlab <- 'Number of Observations'

DT[, meangraphstrength := mean(graphstrength), .(lc, nobs)]

# Edge overlap
gprop <- ggplot(DT, aes(color = lcname)) +
  geom_line(aes(x = nobs, y = propedges),
            size = 2) +
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Edge Overlap', subtitle = 'B)') +
  ylim(0, 1)



# Graph strength
gstr <- ggplot(DT, aes(color = lcname, group = lcname)) +
  geom_line(aes(x = nobs, y = graphstrength, 
                group = ANIMAL_ID),
            alpha = 0.3, size = 1.2) + 
  geom_line(aes(x = nobs, y = meangraphstrength),
            size = 2) + 
  facet_wrap(~lcname) +
  guides(color = FALSE) + 
  scale_color_manual(values = lccolors) +
  base +
  labs(x = NULL, y = 'Graph Strength', subtitle = 'A)')


# Layer similarity
# gsim <- ggplot(DT, aes(color = lcname)) +
#   geom_line(aes(x = nobs, y = layersim)) +
#   guides(color = FALSE) +
#   scale_color_manual(values = lccolors) +
#   base +
#   labs(x = xlab, y = 'Layer Similarity') +
#   scale_x_continuous(expand = c(0, 0))

# Multidegree
gmult <- ggplot(DT, aes(group = ANIMAL_ID)) +
  geom_line(aes(x = nobs, y = multideg)) +
  base +
  labs(x = xlab, y = 'Multidegree', subtitle = 'C)')




# Patchwork ---------------------------------------------------------------
layout <- 'AAAAAAA
           BBBBBBC
           DDDDDDD'
(g <- gstr + gprop + guide_area() + gmult + 
   plot_layout(guides = 'collect', 
               design = layout)
)


# Output ------------------------------------------------------------------
ggsave('graphics/figure-nobs.png',
       g, width = 10, height = 8)

# ggsave('graphics/supp-temp-nid.png',
#        gnid, width = 5, height = 5)
