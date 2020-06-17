# Load drake --------------------------------------------------------------
library(drake)


# Source universal variables and figure theme -----------------------------
source('scripts/figures/theme.R')
source('scripts/00-variables.R')


# Setup scripts as functions ----------------------------------------------
data_prep <- code_to_function('scripts/01-data-prep.R')

# Figure 1
fig_1 <- code_to_function('scripts/figures/figure-scales.R')

# Land Cover
scale_lc <- code_to_function('scripts/02-landcover-scale.R')
fig_lc <- code_to_function('scripts/figures/figure-lc.R')

# Temporal
scale_temp <- code_to_function('scripts/03-temporal-layers.R')
fig_temp <- code_to_function('scripts/figures/figure-temp.R')

# Social Threshold
scale_soc <- code_to_function('scripts/04-social-distance-threshold.R')
fig_soc <- code_to_function('scripts/figures/figure-lc.R')

# Number of Observations
scale_nobs <- code_to_function('scripts/05-number-of-observations.R')
fig_nobs <- code_to_function('scripts/figures/figure-nobs.R')


# TODO: fogo car ml


# Plan --------------------------------------------------------------------
plan <- drake_plan(
  # Package
  scalepkg = expose_imports('ScaleInMultilayerNetworks'),
  
  # Prep data
  data = data_prep(scalepkg),
  
  # Figure 1 
  # figure1 = fig_1(), 
  
  # Land cover
  lc = scale_lc(data),
  lc_figure = fig_lc(lc),
  
  # Temporal
  temp = scale_temp(data),
  temp_figure = fig_temp(temp),
  
  # Social threshold
  soc = scale_soc(data),
  soc_figure = fig_soc(soc),
  
  # Number of observations
  nobs = scale_nobs(data),
  nobs_figure = fig_nobs(nobs)
  
  # TODO: fogo car ml
  
  # TODO: add manuscript
)