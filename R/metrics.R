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



redundancy <- function(DT, id, var) {
  # Check cols
  DT[, connredund := 1 - (splitNeighborhood / neighborhood), 
     by = nobs]
}



multidegree <- function(DT, degreeCol, id, var) {
  DT[, multdeg := sum(splitNeighborhood - 1), 
     by = c(idcol, 'nobs')]
}

