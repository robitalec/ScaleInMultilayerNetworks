### Scale in multilayer networks - time window position
# Alec Robitaille

### Packages ----
pkgs <- c('data.table',
					'ggplot2',
					'spatsoc',
					'rgdal',
					'asnipe',
					'igraph')
p <- lapply(pkgs, library, character.only = TRUE)


### Data ----
DT <- fread('data/FogoCaribou.csv')

### Sub data ----
sub <- DT[Year == 2018]

idcol <- 'ANIMAL_ID'

### Cast columns ----
sub[, idate := as.IDate(idate)]
sub[, itime := as.ITime(itime)]

### Project relocations ----
# UTM zone 21N
projCols <- c('EASTING', 'NORTHING')
utm21N <- '+proj=utm +zone=21 ellps=WGS84'

sub[, (projCols) := as.data.table(project(cbind(X_COORD, Y_COORD), utm21N))]


### Variable time window position ----
winlength <- 75
winpositions <- seq(1, 75, by = 1)
  
lapply(winpositions, function(pos) {
  col <- paste0('season', pos)
  
  sub[between(JDate, 1 + pos, 1 + pos + winlength), (col) := 'winter']
  sub[between(JDate, 215 + pos, 215 + pos + winlength), (col) := 'summer']
})


### Temporal grouping ----
tempthresh <- '5 minutes'

group_times(
  sub,
  datetime =  c('idate', 'itime'),
  threshold = tempthresh
)

### Generate networks for each n observations ----
spatthresh <- 50

# TODO: Careful not including "season" and "season75" after prep
seasoncols <- colnames(sub)[grepl('^season', colnames(sub))]

graphs <- lapply(seasoncols, function(col) {
  # Spatial grouping with spatsoc
  group_pts(
    sub,
    threshold = spatthresh,
    id = idcol,
    coords = projCols,
    timegroup = 'timegroup',
    splitBy = col
  )
  
  usplit <- unique(na.omit(sub, cols = col)[[col]])
  
  # GBI for each season
  gbiLs <- lapply(usplit, function(u) {
    gbi <- get_gbi(
      DT = sub[get(col) == u],
      group = 'group',
      id = idcol
    )
  })

  # Generate networks for each season
  netLs <- lapply(
    gbiLs,
    get_network,
    data_format = 'GBI',
    association_index = 'SRI'
  )

  gLs <- lapply(
    netLs,
    graph.adjacency,
    mode = 'undirected',
    diag = FALSE,
    weighted = TRUE
  )
  names(gLs) <- paste0(col, '-', usplit)
  gLs
})
# TODO: check why different number of individuals as seasons move



### Multilayer network metrics ----
# TODO: difference in degree? between seasons

# TODO: why multiple for same individual
multdeg <- rbindlist(lapply(graphs, function(g) {
  deg <- lapply(g, degree)
  rbindlist(lapply(deg, stack), idcol = 'by')
}))

setnames(multdeg, c('by', 'deg', idcol))

multdeg[, c('winpos', 'season') := tstrsplit(by, '-', type.convert = TRUE)]
multdeg[, winpos := as.integer(gsub('season', '', winpos))]
multdeg[, mdeg := sum(deg), by = c('by', idcol)]


### Plots ----
ggplot(multdeg) + 
  geom_line(aes(winpos, deg)) +
  facet_grid(season~ANIMAL_ID)


# TODO: careful if inconsistent number of individuals
multdeg[, meandeg := mean(deg), .(winpos, season)]
ggplot(multdeg) + 
  geom_line(aes(winpos, meandeg)) +
  facet_wrap(~season)





