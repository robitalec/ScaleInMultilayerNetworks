
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


# Generate network --------------------------------------------------------
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

#1. create a small function
my.function.net <- function(graph){
  
  #calculate some measure from the graph
  my.value <- mean(degree(graph, mode="out"))
  
  #return the value 
  return(my.value)
  
}

graphTS(edgels, 
        )


#2. extract values through time
graph.values <- graphTS(groomEvents, windowsize = days(60), windowshift = days(10), measureFun = my.function.net, directed=TRUE)