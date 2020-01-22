### Scale in multilayer networks - time window position
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
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


### Variable time window position ----
# Remove season column from 1-prep
DT[, season := NULL]

winlength <- 75
winpositions <- seq(1, 75, by = 1)
  
l <- lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  
  DT[between(JDate, 1 + pos, 1 + pos + winlength), (col) := 'winter']
  DT[between(JDate, 215 + pos, 215 + pos + winlength), (col) := 'summer']
  
  # Fake output
  l
})


### Temporal grouping ----
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)

### Generate networks for each n observations ----
nets <- lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  
  sub <- DT[!is.na(get(col))]
  
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = col
  )
  
  # usplit <- unique(na.omit(sub, cols = col)[[col]])
  # 
  # # GBI for each season
  # gbiLs <- lapply(usplit, function(u) {
  #   gbi <- get_gbi(
  #     DT = sub[get(col) == u],
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
  
  neigh(sub, idcol, col)
  
  outcols <- c('neighborhood', 'splitNeighborhood', idcol, col)
  out <- unique(sub[, .SD, .SDcols = outcols])
  setnames(out, col, 'season')
  set(out, j = 'winpos', value = pos)
  
})
# TODO: check why different number of individuals as seasons move
# TODO: difference in degree? between seasons
# TODO: why multiple for same individual
# TODO: careful if inconsistent number of individuals

out <- rbindlist(nets)

### Multilayer network metrics ----
var <- 'winpos'

# Redundancy
redundancy(out)
stopifnot(out[!between(connredund, 0, 1), .N] == 0)

# Multidegree
multidegree(out, 'splitNeighborhood', idcol, var)

# Degree deviation
degdeviation(out, 'splitNeighborhood', idcol, var)

# Relevance
relevance(out, idcol, var, splitBy = splitBy)
stopifnot(out[!between(relev, 0, 1), .N] == 0)

# TODO: network correlation


### Output ----
saveRDS(out, 'data/derived-data/6-time-window-position.Rds')