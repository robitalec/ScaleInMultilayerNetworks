### Packages ----
library(knitcitations)


### Sections ----
## Introduction
# levin, allen
citep(c('10.2307/1941447', '10.7312/alle06918'))

# legendre 93, chave 2013
citep(c('10.2307/1939924', '10.1111/ele.12048')) 

# field 2009
citep('10.1111/j.1365-2699.2008.01963.x')

# eli 2009, mayo2007, sugihara 1989
citep('10.1146/annurev.ecolsys.110308.120159')
citep('10.1890/06-1672.1')
citep('10.1126/science.2740915')

# luthe2009
citep('10.1093/beheco/arp074')


## Case study
### Caribou socioecology
# TODO: Lesmerises 2018 -- check that's right
citep('10.1016/j.anbehav.2018.03.014')

# peignier
citep('10.1002/ece3.5071')

# TODO: Bergerud 1974

# mayor 2009
citep('10.2980/16-2-3238')

### Caribou location 
# TODO: Schaefer and Mahoney (2013)
# TODO: Bjørneraas et al (2010)


### Caribou multilayer social networks
# kivela 2014
citep('10.1093/comnet/cnu016')

# robitaille 2019
citep('10.1111/2041-210X.13215')

# farine whitehead 2015
citep('10.1111/1365-2656.12418')

# Cairns and Schwaeger 1987
citep('10.1016/S0003-3472(87)80018-0')

# raster package
citep(citation('raster'))

## metrics
# berlingerio 2012
citep('10.1007/s11280-012-0190-4')

# brodka
citep('10.1098/rsos.171747')

### Varying scale in multilayer networks
## social scale

## landcover scale
# grainchanger, Graham 2019
citep(citation('grainchanger'))
citep('10.1111/2041-210X.13177')


## temporal scale
# davis 2018

# webber vander 2019


## perspectives

#landscape

# indiv fitness
# brent 2017
citep('10.1098/rspb.2017.0515')
#thompson 2019
citep('10.1163/1568539X-00003552')

#stanton 2011
citep('10.1016/j.anbehav.2011.05.026')
# stanton 2012
citep('10.1371/journal.pone.0047508')

# mcdonald 2007
citep('10.1073/pnas.0701159104')
# royle 2012
citep('10.1098/rspb.2012.1701')

# almeling 2016
citep('10.1016/j.cub.2016.04.066')

# berger 2015
citep('10.1111/j.1365-2656.2007.01351.x')

# holekamp 2012
citep('10.1111/j.1365-294X.2011.05240.x')

# Carter 2015
citep('10.1016/j.anbehav.2015.03.020')

# Castles 2014
citep('10.1016/j.anbehav.2014.07.023')

# farine 2015 proximity as proxy
citep('10.1016/j.anbehav.2014.11.019')

# Snijders & Naguib, 2017
citep('10.1016/bs.asb.2017.02.004')

# Ellis 2019
citep('10.1098/rspb.2019.1991')

# Tarka 2018
citep('10.1007/s00265-018-2534-2')

# Turner 2018
citep('10.1007/s00265-017-2426-x')

# Farine, 2017 static vs dynamic
citep('10.1111/1365-2656.12764')

# Proskurnikov & Tempo, 2017
citep('10.1016/j.arcontrol.2017.03.002')

## movement
# Strandburg-Peshkin 2015
citep('10.1126/science.aaa5099')

# Jolles et al 2019
citep('10.1016/j.tree.2019.11.001')

# Long et al. 2015
citep('10.1111/1365-2656.12198')

# Mourier et al. 2019 (pre-print)
citep('10.1101/749085')

# Silk et al. 2018
citep('10.1016/j.tree.2018.03.008')

# Webber & Vander wal 2018
citep('10.1111/1365-2656.12773')


### R, R Packages
# R
citep(citation())


### Write out bib ----
write.bibtex(file = "references/knitcite.bib")
