BUILD_DIR = ./build

.PHONY: all

all: $(BUILD_DIR)/exportlist.bib $(BUILD_DIR)/integration.pdf $(BUILD_DIR)/non_linear.pdf

$(BUILD_DIR)/exportlist.bib: exportlist.bib
	mkdir -p $(BUILD_DIR)
	cp exportlist.bib $(BUILD_DIR)/


$(BUILD_DIR)/integration.pdf: integration.tex $(BUILD_DIR)/exportlist.bib
	mkdir -p $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) integration.tex
	cd $(BUILD_DIR) && bibtex integration.aux && cd ..
	pdflatex -output-directory=$(BUILD_DIR) integration.tex
	pdflatex -output-directory=$(BUILD_DIR) integration.tex

$(BUILD_DIR)/non_linear.pdf: non_linear.tex $(BUILD_DIR)/exportlist.bib
	mkdir -p $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) non_linear.tex
	cd $(BUILD_DIR) && bibtex non_linear.aux && cd ..
	pdflatex -output-directory=$(BUILD_DIR) non_linear.tex
	pdflatex -output-directory=$(BUILD_DIR) non_linear.tex

