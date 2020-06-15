# Try drake

# install.packages('drake')

library(drake)

source('scripts/figures/theme.R')
source('scripts/00-variables.R')

data_prep <- code_to_function('scripts/01-data-prep.R')
landcover_scale <- code_to_function('scripts/02-landcover-scale.R')
figure_lc <- code_to_function('scripts/figures/figure-lc.R')


plan <- drake_plan(
  data_prep = data_prep)
# ,
#   landcover_scale = landcover_scale(),
#   figure_lc = figure_lc(landcover_scale)
# )

# plan

make(plan, verbose = 1)

