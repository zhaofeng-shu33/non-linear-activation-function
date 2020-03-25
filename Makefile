BUILD_DIR = ./build
DIST_DIR = ./dist

.PHONY: all

all: $(BUILD_DIR)/exportlist.bib $(DIST_DIR)/integration.pdf $(DIST_DIR)/non_linear.pdf

$(BUILD_DIR)/exportlist.bib: exportlist.bib
	mkdir -p $(BUILD_DIR)
	cp exportlist.bib $(BUILD_DIR)/


$(DIST_DIR)/integration.pdf: integration.tex $(BUILD_DIR)/exportlist.bib
	mkdir -p $(BUILD_DIR)
	mkdir -p $(DIST_DIR)
	pdflatex -output-directory=$(BUILD_DIR) integration.tex
	cd $(BUILD_DIR) && bibtex integration.aux && cd ..
	pdflatex -output-directory=$(BUILD_DIR) integration.tex
	pdflatex -output-directory=$(BUILD_DIR) integration.tex
	cp $(BUILD_DIR)/integration.pdf $(DIST_DIR)/integration.pdf

$(DIST_DIR)/non_linear.pdf: non_linear.tex $(BUILD_DIR)/exportlist.bib
	mkdir -p $(BUILD_DIR)
	mkdir -p $(DIST_DIR)
	pdflatex -output-directory=$(BUILD_DIR) non_linear.tex
	cd $(BUILD_DIR) && bibtex non_linear.aux && cd ..
	pdflatex -output-directory=$(BUILD_DIR) non_linear.tex
	pdflatex -output-directory=$(BUILD_DIR) non_linear.tex
	cp $(BUILD_DIR)/non_linear.pdf $(DIST_DIR)/non_linear.pdf

