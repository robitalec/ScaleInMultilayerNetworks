### Makefile 
# Alec Robitaille


VARS = lcres spatialthreshold winpos nobs winlength
METS = data/derived-data/6-time-window-position-metrics.Rds data/derived-data/5-number-of-observations-metrics.Rds data/derived-data/4-time-window-length-metrics.Rds data/derived-data/3-spatial-threshold-metrics.Rds data/derived-data/2-landcover-scale-metrics.Rds
FIGS = graphics/figure-winlength.png graphics/figure-nobs.png graphics/figure-winpos.png graphics/figure-spatialthreshold.png graphics/figure-lcres.png
OUTPUTS = data/derived-data/6-time-window-position.Rds data/derived-data/5-number-of-observations.Rds data/derived-data/4-time-window-length.Rds data/derived-data/3-spatial-threshold.Rds data/derived-data/2-landcover-scale.Rds data/derived-data/1-sub-fogo-caribou.Rds data/derived-data/1-sub-seasons-fogo-caribou.Rds

all: $(FIGS)

$(FIGS): scripts/8-plots.R $(METS)
	$(foreach var, $(VARS), Rscript scripts/8-plots.R $(var);)
	rm Rplots.pdf

$(METS): scripts/7-metrics.R $(OUTPUTS)
	$(foreach var, $(VARS), Rscript scripts/7-metrics.R $(var);)

data/derived-data/6-time-window-position.Rds: scripts/6-time-window-position.R scripts/1-data-prep.R
	Rscript scripts/6-time-window-position.R
	
data/derived-data/5-number-of-observations.Rds: scripts/5-number-of-observations.R scripts/1-data-prep.R
	Rscript scripts/5-number-of-observations.R
	
data/derived-data/4-time-window-length.Rds: scripts/4-time-window-length.R scripts/1-data-prep.R
	Rscript scripts/4-time-window-length.R

data/derived-data/3-spatial-threshold.Rds: scripts/3-spatial-threshold.R scripts/1-data-prep.R
	Rscript scripts/3-spatial-threshold.R
	
data/derived-data/2-landcover-scale.Rds: scripts/2-landcover-scale.R scripts/1-data-prep.R
	Rscript scripts/2-landcover-scale.R
	
data/derived-data/1-sub-fogo-caribou.Rds data/derived-data/1-sub-seasons-fogo-caribou.Rds: scripts/1-data-prep.R scripts/0-variables.R
	Rscript scripts/1-data-prep.R