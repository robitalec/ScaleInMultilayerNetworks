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