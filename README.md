
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

# The problem and promise of scale in multilayer networks

Alec Robitaille, Quinn M.R. Webber, Julie Turner and Eric Vander Wal

## TODO

``` bash
grep -rni 'R/' -e 'TODO' || true;
grep -rni 'scripts/' -e 'TODO' || true;
#> R/metrics.R:83:  # TODO: Check cols
#> R/metrics.R:84:  # TODO: warn overwrite 
#> R/metrics.R:104:  # TODO: check columns
#> R/metrics.R:105:  # TODO: warn overwrite
#> R/metrics.R:126:  # TODO: check columns
#> R/metrics.R:127:  # TODO: warn overwrite
#> R/metrics.R:152:  # TODO: check for splitNeighborhood variable and multidegree
#> R/metrics.R:153:  # TODO: check overwrite
#> scripts/3-spatial-threshold.R:31:# TODO: why duplicate ids.. check new data
#> scripts/3-spatial-threshold.R:32:# TODO: drop this 
#> scripts/3-spatial-threshold.R:68:# TODO: fix implementation of var
#> scripts/3-spatial-threshold.R:72:# TODO: network correlation
#> scripts/7-plots.R:35:# TODO: problem is none of these are weighted, they are all integer, so not varying after all individuals
#> scripts/7-plots.R:36:# TODO: think about cutting these off where they settle and including extended versions in supplemental
#> scripts/6-time-window-position.R:101:# TODO: check why different number of individuals as seasons move
#> scripts/6-time-window-position.R:102:# TODO: difference in degree? between seasons
#> scripts/6-time-window-position.R:103:# TODO: why multiple for same individual
#> scripts/6-time-window-position.R:104:# TODO: careful if inconsistent number of individuals
#> scripts/6-time-window-position.R:125:# TODO: network correlation
#> scripts/1-data-prep.R:8:# TODO: read in as rds everywhere else
#> scripts/1-data-prep.R:9:# TODO: timezones
#> scripts/1-data-prep.R:10:# TODO: rm old prep from all
#> scripts/1-data-prep.R:11:# TODO: confirm seasons
#> scripts/1-data-prep.R:12:# TODO: dont drop if na season here
#> scripts/1-data-prep.R:13:# TODO: which individuals are dropped
#> scripts/5-number-of-observations.R:51:  # TODO: if dont find a weighted, then this is not needed and you can pull neigh out on a by.
#> scripts/5-number-of-observations.R:87:# TODO: check "found duplicate id in a timegroup and/or splitBy - does your group_times threshold match the fix rate?"
#> scripts/5-number-of-observations.R:107:# TODO: network correlation
#> scripts/4-time-window-length.R:27:# TODO: should this be a smaller min window size?
#> scripts/4-time-window-length.R:101:# TODO: fix new data 'found duplicate id in a timegroup and/or splitBy - does your group_times threshold match the fix rate?'
#> scripts/4-time-window-length.R:122:# TODO: network correlation
#> scripts/2-landcover-scale.R:140:# TODO: network correlation
```

## Info

[Special Column
info](https://academic.oup.com/CZ/pages/animal_social_system)

### Deadlines

  - ~~Abstract submission: 30 August 2019~~
  - Manuscript submission: 31 January 2020
  - Printing: June 2020

### Guidelines

[General Instructions
page](https://academic.oup.com/cz/pages/General_Instructions)
