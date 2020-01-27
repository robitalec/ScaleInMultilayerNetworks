# Graph/network/gbi b'y

#' GBI
#'
#' @param DT 
#' @param id 
#' @param splitList 
#' @param splitBy 
#' @param group 
#'
#' @return
#' @export
#'
#' @examples
list_gbi <- function(DT, id, splitBy, group = 'group') {
  splits <- unique(DT[, .SD, .SDcols = splitBy])
  
  ls <- lapply(seq(nrow(splits)), function(s) {
    gbi <- spatsoc::get_gbi(
      DT = DT[splits[s], on = splitBy],
      group = group,
      id = id
    )
  })
  
  names(ls) <- splits[, do.call(paste, c(.SD, sep = '-'))]
  ls
}


#' Networks
#'
#' @param gbiLs 
#' @param format 
#' @param ai 
#'
#' @return
#' @export
#'
#' @examples
list_nets <- function(gbiLs, format = 'GBI', ai = 'SRI') {
  lapply(
    gbiLs,
    asnipe::get_network,
    data_format = format,
    association_index = ai
  )
}


#' Graphs
#'
#' @param netLs 
#' @param mode 
#' @param diag 
#' @param weighted 
#'
#' @return
#' @export
#'
#' @examples
list_graphs <- function(netLs, mode = 'undirected', diag = FALSE, weighted = TRUE) {
  lapply(
    netLs,
    igraph::graph.adjacency,
    mode = mode,
    diag = diag,
    weighted = weighted
  )
}
