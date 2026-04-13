ROOT := main
PDF := $(ROOT).pdf

LATEXMK := latexmk
LATEXMK_OPTS := -e '$$pdf_mode=3; $$latex=q/uplatex %O %S/; $$dvipdf=q/dvipdfmx %O -o %D %S/'

.PHONY: all pdf clean distclean

all: pdf

pdf:
	$(LATEXMK) $(LATEXMK_OPTS) $(ROOT).tex

clean:
	$(LATEXMK) -c $(ROOT).tex

distclean: clean
	rm -f $(PDF)
