### Scale in multilayer networks - behavioural states
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
          'ggplot2',
          'spatsoc',
          'moveHMM',
          'asnipe',
          'igraph',
          'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- readRDS('data/derived-data/1-sub-fogo-caribou.Rds')
alloc.col(DT)


### moveHMM ----
setorderv(DT, cols = c(idcol, datecol))
prepDT <-
  prepData(DT[, .(EASTING, NORTHING, ID = get(idcol))],
           type = 'UTM', coordNames = projCols)

# TODO: randomize + compare m
stepPar0 = c(100, 1000, 100, 1000, 0.01, 0.001)
anglePar0 = c(pi, 0, 0.1, 2)

m <- fitHMM(
  data = prepDT,
  nbStates = 2,
  stepPar0 = stepPar0,
  anglePar0 = anglePar0
)

# TODO: Some of the parameter estimates seem to lie close to the boundaries of their parameter space.
#       The associated CIs are probably unreliable (or might not be computable).

DT[, state := viterbi(m)]


### Temporal grouping with spatsoc ----
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)


