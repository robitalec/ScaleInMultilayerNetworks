# === Fogo Caribou Multilayer Network -------------------------------------
# Alec Robitaille


# Packages ----------------------------------------------------------------
pkgs <- c('data.table',
          'ggplot2',
          'spatsoc',
          'rgdal',
          'asnipe',
          'igraph',
          'ggnetwork',
          'ScaleInMultilayerNetworks')
p <- lapply(pkgs, library, character.only = TRUE)


# Variables ---------------------------------------------------------------
source('scripts/00-variables.R')


# Input -------------------------------------------------------------------
DT <- readRDS('data/derived-data/01-sub-fogo-caribou.Rds')
alloc.col(DT)



# Chunk time --------------------------------------------------------------
nchunk <- 20

setorder(DT, Year, JDate)
DT[, dayoffull := .GRP, .(JDate, Year)]

DT[, cutJDate := cut(dayoffull, nchunk, include.lowest = TRUE)]
DT[, timecut := .GRP, cutJDate]

DT[, date := as.IDate(datetime)]
DT[, mindate := min(date), by = timecut]
DT[, maxdate := max(date), by = timecut]

DT[, nid := uniqueN(ANIMAL_ID), timecut]


# Group chunks
DT[timecut == 1, season := 'drop']
DT[timecut %in% 2:5, season := 1]
DT[timecut %in% 6:11, season := 2]
DT[timecut %in% 12:15, season := 3]
DT[timecut %in% 16:20, season := 4]

#TODO: set years
