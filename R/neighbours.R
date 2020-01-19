neigh <- function(DT, id, splitBy = NULL) {
  if (any(!(c(id, 'group', splitBy) %in% colnames(DT)))) {
    stop(paste0(
      as.character(paste(setdiff(
        c(id, 'group', splitBy), colnames(DT)
      ), collapse = ", ")),
      " field(s) provided are not present in input DT"
    ))
  }
  
  # with splitBy
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
    by = id][]
    
    
    DT[, splitNeighborhood := {
      g <- group
      DT[group %in% g, data.table::uniqueN(get(id))]
    },
    by = c(splitBy, id)][]
  }
}

neigh(nsub, 'ANIMAL_ID', 'season')

ggplot(nsub) +
  geom_point(aes(ANIMAL_ID, neighborhood), size = 3) + 
  geom_point(aes(ANIMAL_ID, splitNeighborhood),
             color = 'red', size = 1) +
  facet_wrap(~ season)

