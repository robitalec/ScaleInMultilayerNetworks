# === Figure 3 ------------------------------------------------------------
# Land Cover Resolution
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'ggplot2', 'patchwork')
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

count[lc %in% c(1, 2, 3), percent := N / sum(N), by = res]

ggplot(count[lc %in% c(1, 2, 3)]) + 
  geom_line(aes(res, percent, linetype = factor(lcname), group = lcname)) +
  scale_linetype_manual(values = linetypes)


ggplot(DT) + 
  geom_line(aes(lcres, propedges, color = lcname))


DT[, meangraphstrength := mean(graphstrength, na.rm = TRUE),
   .(lcname, lcres)]

ggplot(DT) + 
  geom_line(aes(lcres, graphstrength, group = ANIMAL_ID), 
            alpha = 0.7, color = 'grey') +
  geom_line(aes(lcres, meangraphstrength)) +
  facet_wrap(~ lcname) + 
  guides(color = FALSE)


# Output ------------------------------------------------------------------



