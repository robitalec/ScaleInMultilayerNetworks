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