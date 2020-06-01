### Makefile 
# Alec Robitaille


VARS = lcres spatialthreshold time nobs
METS = data/derived-data/5-number-of-observations-metrics.Rds data/derived-data/4-temporal-layers-metrics.Rds data/derived-data/3-spatial-threshold-metrics.Rds data/derived-data/2-landcover-scale-metrics.Rds
FIGS = graphics/figure-winlength.png graphics/figure-nobs.png graphics/figure-winpos.png graphics/figure-spatialthreshold.png graphics/figure-lcres.png
OUTPUTS = data/derived-data/5-number-of-observations.Rds data/derived-data/4-temporal-layers.Rds data/derived-data/3-spatial-threshold.Rds data/derived-data/2-landcover-scale.Rds data/derived-data/1-sub-fogo-caribou.Rds data/derived-data/1-sub-seasons-fogo-caribou.Rds

all: $(FIGS)

$(FIGS): scripts/08-plots.R $(METS)
	$(foreach var, $(VARS), Rscript scripts/08-plots.R $(var);)
	rm Rplots.pdf

$(METS): scripts/07-metrics.R $(OUTPUTS)
	$(foreach var, $(VARS), Rscript scripts/07-metrics.R $(var);)

data/derived-data/6-time-window-position.Rds: scripts/06-time-window-position.R scripts/01-data-prep.R
	Rscript scripts/06-time-window-position.R
	
data/derived-data/5-number-of-observations.Rds: scripts/05-number-of-observations.R scripts/01-data-prep.R
	Rscript scripts/05-number-of-observations.R
	
data/derived-data/4-time-window-length.Rds: scripts/04-time-window-length.R scripts/01-data-prep.R
	Rscript scripts/04-time-window-length.R

data/derived-data/3-spatial-threshold.Rds: scripts/03-spatial-threshold.R scripts/01-data-prep.R
	Rscript scripts/03-spatial-threshold.R
	
data/derived-data/2-landcover-scale.Rds: scripts/02-landcover-scale.R scripts/01-data-prep.R
	Rscript scripts/02-landcover-scale.R
	
data/derived-data/1-sub-fogo-caribou.Rds data/derived-data/1-sub-seasons-fogo-caribou.Rds: scripts/01-data-prep.R scripts/00-variables.R
	Rscript scripts/01-data-prep.R