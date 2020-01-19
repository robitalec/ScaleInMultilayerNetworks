nsub


neigh <- function(DT, id, splitBy) {
  if (any(!(c(id, 'group', splitBy) %in% colnames(DT)))) {
    stop(paste0(
      as.character(paste(setdiff(
        c(id, 'group', splitBy), colnames(DT)
      ), collapse = ", ")),
      " field(s) provided are not present in input DT"
    ))
  }
  
  # with splitBy
  }
  DT[, {
    g <- group
    DT[group %in% g, data.table::uniqueN(get(id))]
  },
  by = c(splitBy, id)][
    DT[, {
      g <- group
      DT[group %in% g, data.table::uniqueN(get(id))]
      },
      by = id],
  on = id]
  
  # 
  # DT[, {
  #   g <- group
  #   DT[group %in% g, data.table::uniqueN(get(id))]
  # },
  # c(splitBy, id)]
  
  
  
}

neigh(nsub, 'ANIMAL_ID', 'season')
# nsub[, {
#   g <- group
#   nsub[group %in% g, uniqueN(ANIMAL_ID)]}, 
#      .(season, ANIMAL_ID)]


# nsub[group %in% nsub[ANIMAL_ID == 'FO2017003', group],
#      uniqueN(ANIMAL_ID)]

