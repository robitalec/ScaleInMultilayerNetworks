# Graph/network b'y

list_nets <- function(gbiLs, format = 'GBI', ai = 'SRI') {
  lapply(
    gbiLs,
    asnipe::get_network,
    data_format = format,
    association_index = ai
  )
}


list_graphs <- function(netLs, mode = 'undirected', diag = FALSE, weighted = TRUE) {
  lapply(
    netLs,
    igraph::graph.adjacency,
    mode = mode,
    diag = diag,
    weighted = weighted
  )
}