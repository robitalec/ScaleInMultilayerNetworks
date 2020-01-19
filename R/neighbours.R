nsub



nsub[, {
  g <- group
  nsub[group %in% g, uniqueN(ANIMAL_ID)]}, 
     .(season, ANIMAL_ID)]


nsub[group %in% nsub[ANIMAL_ID == 'FO2017003', group],
     uniqueN(ANIMAL_ID)]
