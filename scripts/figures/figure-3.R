# === Figure 3 ------------------------------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table', 'ggplot2', 'patchwork')
p <- lapply(pkgs, library, character.only = TRUE)


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/2-landcover-scale.Rds')
count <- readRDS('data/derived-data/2-landcover-scale-count.Rds')



# Plot --------------------------------------------------------------------

ggplot(count[lc %in% c(1, 2, 3)]) + 
  geom_line(aes(res, N, color = factor(lc), group = lc))

ggplot(out) + 
  geom_line(aes(lcres, propedges, color = layer))


ggplot(out) + geom_line(aes(lcres, graphstrength, color = ANIMAL_ID)) + 
  facet_wrap(~ layer) + 
  guides(color = FALSE)


# Output ------------------------------------------------------------------



