#' Shear XY for stacked plotting
#' Thanks to [@rafapereirabr](https://github.com/rafapereirabr) for this gist (https://gist.github.com/rafapereirabr/97a7c92d40f91cd20a10e8e0165a0aef) and Barry Rowlingson for the original SO answer (http://gis.stackexchange.com/questions/189490/plot-tilted-map-in-r)
#' 
#' @param DT 
#' @param coordcols length 2
#' @param shearmatrix 
#'
#' @return
#' @export
#'
#' @examples
shear_xy <- function(DT, coordcols, shearmatrix = matrix(c(2,1.2,0,1),2,2)) {
  # TODO: check that coordcols exist in DT and are length two
  
  DT[, c('shearx', 'sheary') := data.table(as.matrix(.SD) %*% shearmatrix), .SDcols = coordcols]
}

#' Check col
#' @param DT data.table
#' @param col column name
#' @param arg argument name
#' @param extra extras
#' @keywords internal
check_col <- function(DT = NULL, col = NULL, arg = NULL, extra = NULL) {
  
  if (is.null(arg)) {
    it <- col
  } else {
    it <- paste0(arg, " ('", col, "')")
  }
  
  if (!(col %in% colnames(DT))) {
    stop(paste0(it, ' column not found in DT', extra))
  }
}

#' check type
#' @param DT data.table.
#' @param col column name.
#' @param type typeof type type typeof type.
#' @keywords internal
check_type <- function(DT = NULL, col = NULL, type = NULL) {
  if (!(typeof(DT[[col]]) %in% type)) {
    stop(paste0(col, ' does not match required type: ', type))
  }
}

#' check_truelength
#' @param DT data.table
#' @keywords internal
check_truelength <- function(DT) {
  if (truelength(DT) == 0) {
    stop('please run data.table::alloc.col on your DT to allocate columns')
  }
}
