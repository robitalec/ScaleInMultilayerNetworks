
# Packages ----------------------------------------------------------------
# devtools::install_github("tbonne/netTS")
library(netTS)
library(lubridate)
library(ggplot2)
library(igraph)
library(reshape2)

library(data.table)
library(spatsoc)
library(asnipe)

# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/01-sub-fogo-caribou.Rds')
alloc.col(DT)



# Temporal grouping with spatsoc ------------------------------------------
group_times(
  DT,
  datetime =  c(datecol, timecol),
  threshold = tempthresh
)



# Generate edge list ------------------------------------------------------
# Spatial grouping with spatsoc
group_pts(
  DT,
  threshold = spatthresh,
  id = idcol,
  coords = projCols,
  timegroup = 'timegroup',
  splitBy = splitBy
)


# Get edge list
edgelist <- get_edgelist(DT, 'group', idcol)

edgelist[DT[, .SD[1], by = group, .SDcols = 'datetime'], 
         datetime := datetime, on = 'group']


mean_degree <- function(graph){
  mean(igraph::degree(graph))
}

graphTS(edgelist, windowsize = days(60), windowshift = days(10),
        measureFun = mean_degree, directed = FALSE, SRI = TRUE)
