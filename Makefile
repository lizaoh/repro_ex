## Paths
DATA = data
SCRIPTS = scripts
OUT = out
PAPER = paper

## Primary targets: all; (analysis) pipe and paper
all: pipe paper

## Analysis pipe
pipe: $(OUT)/02_plot.png
$(OUT)/02_plot.png: $(SCRIPTS)/02_analysis.R \
                    $(DATA)/01_data.Rds
	cd $(SCRIPTS); Rscript -e "rmarkdown::render('02_analysis.R')"

# Exercise for the reader
# $(DATA)/01_data.Rds: ??
#	??

paper: $(PAPER)/paper.pdf
$(PAPER)/paper.pdf: $(PAPER)/paper.md \
                    $(PAPER)/refs.json \
                    pipe
	cd $(PAPER); pandoc paper.md -o paper.pdf --citeproc

