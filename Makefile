### Makefile 
# Alec Robitaille


VARS = lcres spatialthreshold winpos nobs winlength
METS = data/derived-data/6-time-window-position-metrics.Rds data/derived-data/5-number-of-observations-metrics.Rds data/derived-data/4-time-window-length-metrics.Rds data/derived-data/3-spatial-threshold-metrics.Rds data/derived-data/2-landcover-scale-metrics.Rds
FIGS = graphics/figure-winlength.png graphics/figure-nobs.png graphics/figure-winpos.png graphics/figure-spatialthreshold.png graphics/figure-lcres.png


all: $(FIGS)

$(FIGS): scripts/8-plots.R $(METS)
	$(foreach var, $(VARS), Rscript scripts/8-plots.R $(var););
	rm Rplots.pdf

$(METS): scripts/7-metrics.R
	$(foreach var, $(VARS), Rscript scripts/7-metrics.R $(var);)
	
	
# TODO: Add for each var