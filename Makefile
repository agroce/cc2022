# set this to the basename of the .tex file
# This will also be the name of the generated .dvi, .ps and .pdf files
PAPER = main

.PHONY: $(PAPER).pdf all clean

# Set this to the other source files that should be counted as
# dependencies
OTHERSOURCES := bibliography.bib \
	acmart.bib \
	$(filter-out $DOC, $(wildcard *.tex))

all: $(PAPER).pdf 


tidy:
	rm -rf *.aux *.out *.bbl *.toc *.log *.blg *.pyg *.cpt _minted*

# Using latexmk to generate the PDF
$(PAPER).pdf: $(PAPER).tex $(OTHERSOURCES)
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $(PAPER).tex

clean: tidy
	latexmk -CA
