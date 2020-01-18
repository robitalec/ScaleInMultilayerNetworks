### Multilayer network metrics
# Alec Robitaille


# degree centrality = degree across layers, 
#   for a flattened multilayer this equals the sum of degree across layers


# degree deviation = standard deviation of degree across layers. 
#   if 0, this individual has no difference in 
#   presence/absence/number of connections across layers. 
#   if large, the individual is differently connected in different layers.



# neighborhood = number of neighbours across layers, 
#   where neighbour are the distinct actors connected to each actor. 
#   vs degree, only counts unique, so redundant neighbours are dropped

# connective redundancy = 1 - (neighborhood / degree) when conn redundancy is 0, 
#   all edges on all layers are necessary to preserve the social ties


# relevance = neighborhood of specific layer  / neighbourhood of full ml net 
#   this is the prop of neighbours present on the layer of focus. 
#   compare across, for each actor = which layers most important 


# layer similarity = correlation of association matrices. (ensuring row order same)
cor(c(net[[1]]), c(net[[2]]))