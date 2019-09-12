# Social association by landcover type


library(spatsoc)

DT <- fread('')

group_times(DT, 'datetime', '5 minutes')

group_pts(
  DT,
  ....
  
  splitBy = 'landcover'
        )


# make graphs by landcover



# ----

predatorMCP <- mcp

gOverlap(points, predatorMCP)


# points has column overlapPredator TRUE/FALSE indicating spatial overlap/
# is point within predator HR

group_pts(
  splitBy = 'overlapPred'
)

# two graphs, in or not in predator HR
# result is: degree of sociality within/outside predator HR

