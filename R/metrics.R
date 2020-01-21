#' Neighbourhood
#'
#' @inheritParams group_pts 
#'
#' @return
#' @export
#'
#' @examples
#' neigh(DT, 'id', splitBy = 'season')
neigh <- function(DT, id, splitBy = NULL) {
  if (any(!(c(id, 'group', splitBy) %in% colnames(DT)))) {
    stop(paste0(
      as.character(paste(setdiff(
        c(id, 'group', splitBy), colnames(DT)
      ), collapse = ", ")),
      " field(s) provided are not present in input DT"
    ))
  }
  
  # flex splitBy
  if (is.null(splitBy)) {
    DT[, neighborhood := {
        g <- group
        DT[group %in% g, data.table::uniqueN(get(id))]
      },
      by = id][]
  } else {
    DT[, neighborhood := {
      g <- group
      DT[group %in% g, data.table::uniqueN(get(id))]
    },
    by = id]
    
    
    DT[, splitNeighborhood := {
      g <- group
      DT[group %in% g, data.table::uniqueN(get(id))]
    },
    by = c(splitBy, id)][]
  }
}



#' Connective Redundancy
#'
#' When connective redundancy is 0, all edges on all layers 
#' are necessary to preserve the social ties
#' 
#' DT must be result of `neigh()` function, having columns "splitNeighborhood" 
#' and "neighborhood"
#' 
#' @param DT 
#' @return
#' @export
#'
#' @examples
redundancy <- function(DT) {
  # TODO: Check cols
  # TODO: warn overwrite 
  
  DT[, connredund := 1 - (splitNeighborhood / neighborhood)][]
}



#' Multidegree
#'
#' @param DT 
#' @param degree 
#' @param splitBy this is not the splitBy (eg season)
#' @param id 
#'
#' @return
#' @export
#'
#' @examples
multidegree <- function(DT, degree, id, splitBy = NULL) {
  # TODO: check columns
  # TODO: warn overwrite
  
  DT[, multdeg := sum(.SD),
     .SDcol = degree,
     by = c(id, splitBy)][]
}


#' Relevance
#' 
#' Proportion of neighbours present on each layer.  
#'
#' @param DT 
#' @param id 
#' @param var 
#' @param splitBy 
#'
#' @return
#' @export
#'
#' @examples
relevance <- function(DT, id, var, splitBy) {
  # check for splitNeighborhood variable and multidegree
  
  DT[, relevance := splitNeighborhood / multdeg, 
     by = c(idcol, 'nobs', splitBy)]
  
}



### Extra -----------
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
