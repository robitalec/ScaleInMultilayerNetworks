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

### R, R Packages
# R
citep(citation())


### Write out bib ----
write.bibtex(file = "references/knitcite.bib")
