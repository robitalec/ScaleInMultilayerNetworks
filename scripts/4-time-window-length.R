### Scale in multilayer networks - time window length
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'ggplot2',
					'spatsoc',
					'rgdal',
					'asnipe',
					'igraph',
					'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


### Variables ----
source('scripts/0-variables.R')


### Data ----
DT <- readRDS('data/derived-data/sub-2018-fogo-caribou.Rds')
alloc.col(DT)

### Variable time window length ----
# Remove season column from 1-data-prep.R
DT[, season := NULL]

winlengths <- seq(75, 150, 5)
  
l <- lapply(winlengths, function(l) {
  col <- paste0('season', l)
  
  DT[between(JDate, 1, 1 + l), (col) := 'winter']
  DT[between(JDate, 215, 215 + l), (col) := 'summer']
  
  # Fake output
  l
})


### Temporal grouping ----
group_times(
  DT,
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)

### Generate networks for each n observations ----
graphs <- lapply(winlengths, function(len) {
  col <- paste0('season', len)
  
  # Spatial grouping with spatsoc
  group_pts(
    DT,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = col
  )
  
  # usplit <- unique(na.omit(DT, cols = col)[[col]])
  # 
  # # GBI for each season
  # gbiLs <- lapply(usplit, function(u) {
  #   gbi <- get_gbi(
  #     DT = DT[get(col) == u],
  #     group = 'group',
  #     id = idcol
  #   )
  # })
  # 
  # # Generate networks for each season
  # netLs <- lapply(
  #   gbiLs,
  #   get_network,
  #   data_format = 'GBI',
  #   association_index = 'SRI'
  # )
  # 
  # gLs <- lapply(
  #   netLs,
  #   graph.adjacency,
  #   mode = 'undirected',
  #   diag = FALSE,
  #   weighted = TRUE
  # )
  # names(gLs) <- paste0(col, '-', usplit)
  # gLs
  
  neigh(DT, idcol, col)
  
  outcols <- c('neighborhood', 'splitNeighborhood', idcol, col)
  out <- unique(DT[, .SD, .SDcols = outcols])
  set(out, j = 'winlength', value = len)
})

### Multilayer network metrics ----
# TODO: difference in degree? between seasons
# TODO: why multiple for same individual
multdeg <- rbindlist(lapply(graphs, function(g) {
  deg <- lapply(g, degree)
  rbindlist(lapply(deg, stack), idcol = 'by')
}))

setnames(multdeg, c('by', 'deg', idcol))

multdeg[, c('winlength', 'season') := tstrsplit(by, '-', type.convert = TRUE)]
multdeg[, winlength := as.integer(gsub('season', '', winlength))]
multdeg[, mdeg := sum(deg), by = c('by', idcol)]


### Plots ----
ggplot(multdeg) + 
  geom_line(aes(winlength, deg)) +
  facet_grid(season~ANIMAL_ID)




