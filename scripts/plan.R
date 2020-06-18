# Load drake --------------------------------------------------------------
library(drake)


# Options -----------------------------------------------------------------
# Set renv option for auto snapshots 
options(renv.config.auto.snapshot = TRUE)


# Setup scripts as functions ----------------------------------------------
# Variables
get_vars <- code_to_function('scripts/00-variables.R')

# Figure themes
get_theme <- code_to_function('scripts/figures/theme.R')

# Data prep
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
  
  # Vars
  vars = get_vars(),
  
  # Theme
  theme = get_theme(),
  
  # Prep data
  data = data_prep(scalepkg, vars),
  
  # Figure 1 
  # figure1 = fig_1(), 
  
  # Land cover
  lc = scale_lc(data, vars),
  lc_figure = fig_lc(lc, vars, theme),
  
  # Temporal
  temp = scale_temp(data, vars),
  temp_figure = fig_temp(temp, vars, theme),
  
  # Social threshold
  soc = scale_soc(data, vars),
  soc_figure = fig_soc(soc, vars, theme),
  
  # Number of observations
  nobs = scale_nobs(data, vars),
  nobs_figure = fig_nobs(nobs, vars, theme),
  
  # TODO: fogo car ml
  
  # Manuscript
  manuscript = rmarkdown::render(
    knitr_in('paper/manuscript.Rmd')
  ),
  
  # Supplement
  supplement = rmarkdown::render(
    knitr_in('paper/supplement.Rmd')
  )
)