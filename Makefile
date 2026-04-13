ROOT ?= main
DIR ?=

LATEXMK := latexmk
LATEXMK_OPTS := -cd -e '$$pdf_mode=3; $$latex=q/uplatex %O %S/; $$dvipdf=q/dvipdfmx %O -o %D %S/'

.PHONY: all pdf clean distclean help check-dir

all: pdf

help:
	@echo "Usage: make DIR=4S_1 [pdf|clean|distclean]"
	@echo "Example: make DIR=4S_1"

check-dir:
	@test -n "$(DIR)" || (echo "DIR is required. Example: make DIR=4S_1" && exit 1)
	@test -d "$(DIR)" || (echo "Directory not found: $(DIR)" && exit 1)
	@test -f "$(DIR)/$(ROOT).tex" || (echo "TeX file not found: $(DIR)/$(ROOT).tex" && exit 1)

pdf: check-dir
	$(LATEXMK) $(LATEXMK_OPTS) $(DIR)/$(ROOT).tex

clean: check-dir
	$(LATEXMK) -cd -c $(DIR)/$(ROOT).tex

distclean: clean
	rm -f $(DIR)/$(ROOT).pdf
