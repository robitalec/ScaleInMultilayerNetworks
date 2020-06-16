# Load drake --------------------------------------------------------------
library(drake)


# Source universal variables and figure theme -----------------------------
source('scripts/figures/theme.R')
source('scripts/00-variables.R')


# Setup scripts as functions ----------------------------------------------
data_prep <- code_to_function('scripts/01-data-prep.R')
landcover_scale <- code_to_function('scripts/02-landcover-scale.R')
figure_lc <- code_to_function('scripts/figures/figure-lc.R')



# Plan --------------------------------------------------------------------
plan <- drake_plan(
  data = data_prep,
  lc = landcover_scale(data),
  fig_lc = figure_lc(lc)
)