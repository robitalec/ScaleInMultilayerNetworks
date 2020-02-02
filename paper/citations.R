# Package
library(knitcitations)


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


write.bibtex(file = "references/knitcite.bib")
