# === Fogo Caribou Multilayer Network -------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'spatsoc',
          'rgdal',
          'asnipe',
          'igraph',
          'ggnetwork',
          'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
if(interactive()) {
  source('scripts/00-variables.R')
}

# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/01-sub-fogo-caribou.Rds')
alloc.col(DT)

legend <- data.table(lc = c(1, 2, 3),
                     lcname = c('Open', 'Forest', 'Forage'))

DT[legend, lcname := lcname, on = 'lc']


# Chunk time --------------------------------------------------------------
nchunk <- 20

setorder(DT, Year, JDate)
DT[, dayoffull := .GRP, .(JDate, Year)]

DT[, cutJDate := cut(dayoffull, nchunk, include.lowest = TRUE)]
DT[, timecut := .GRP, cutJDate]

DT[, date := as.IDate(datetime)]
DT[, mindate := min(date), by = timecut]
DT[, maxdate := max(date), by = timecut]

DT[, nid := uniqueN(ANIMAL_ID), timecut]


# Group chunks
# drop timecut 1 and na lc
DT <- DT[timecut != 1 & !is.na(lc)]

DT[, season := NULL]

DT[timecut %in% 2:5, season := 1]
DT[timecut %in% 6:11, season := 2]
DT[timecut %in% 12:15, season := 3]
DT[timecut %in% 16:20, season := 4]

DT[, c('seasonstart', 'seasonend') := 
     .(min(as.IDate(datetime)), max(as.IDate(datetime))),
   season]
DT[, seasonnm := 
     paste(format(seasonstart, '%b'), year(seasonstart), '-', 
           format(seasonend, '%b'), year(seasonend)),
   season]


# Temporal grouping with spatsoc ------------------------------------------
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)


# Generate network for each time chunk ------------------------------------
var <- 'season'
splitBy <- c(var, 'lcname')

# Spatial grouping with spatsoc
group_pts(
  DT,
  threshold = spatthresh,
  id = idcol,
  coords = projCols,
  timegroup = 'timegroup',
  splitBy = splitBy
)


# GBI
gbiLs <- list_gbi(DT, idcol, splitBy)

# Generate networks
netLs <- list_nets(gbiLs)

# Generate graphs
gLs <- list_graphs(netLs)
names(gLs) <- names(gbiLs)

# Generate edge lists
eLs <- list_edges(gLs)

# Calculate edge overlap
eovr <- edge_overlap(eLs)
eovr[, edgeoverlapmat := list(edge_overlap_mat(eLs))]

# Calculate eigenvector centrality
stren <- layer_strength(gLs)
stren[, (splitBy) := tstrsplit(layer, '-', type.convert = TRUE)]
setnames(stren, 'ind', idcol)

# Calculate neighbors
layer_neighbors(DT, idcol, splitBy = splitBy)

# and tidy output, prep for merge
outcols <- c('neigh', 'splitNeigh', idcol, 
             splitBy, 'seasonstart', 'seasonend', 'nid')
usub <- unique(DT[, .SD, .SDcols = outcols])

# Merge eigcent+correlations with neighbors
wstren <- usub[stren, on = c(idcol, splitBy)]

# Merge edge overlap
wedgeovr <- wstren[eovr, on = 'layer']

# Property matrix
# matrices <- property_matrix(wedgeovr, idcol, 'splitNeigh', 'lcname', var)
# layer_similarity_ordinal(matrices, 'FO', var)
# 
# out <- wedgeovr[matrices[, .(layersim, layer)], on = 'layer']


out <- wedgeovr


# Generate figure data ----------------------------------------------------
# XY for each node
rbindxy <- rbindlist(lapply(gLs, ggnetwork), idcol = 'layer')
xy <- rbindxy[order(-layer)][, .SD[1], by = name, .SDcols = c('x', 'y')]

repxy <- xy[rep(seq_len(nrow(xy)), times = rbindxy[, uniqueN(layer)])]
repxy[, layer := rep(names(gLs), each = uniqueN(name))]

# Edges by layer
edges <- rbindlist(lapply(gLs, as_data_frame, what = 'edges'), idcol = 'layer')

# Yuck double merge for from and to coords
mxby <- c('name', 'layer')
myby <- c('from', 'layer')
xyedges <- merge(repxy,
                 edges,
                 by.x = mxby,
                 by.y = myby,
                 all = TRUE)
myby <- c('to', 'layer')
zzz <-
  merge(
    repxy,
    xyedges,
    by.x = mxby,
    by.y = myby,
    suffixes = c('', 'end'),
    all = TRUE
  )[!is.na(name)]


# Output ------------------------------------------------------------------
saveRDS(out, 'data/derived-data/07-fogo-ml.Rds')
saveRDS(zzz, 'data/derived-data/07-fogo-ml-network-fig-data.Rds')
