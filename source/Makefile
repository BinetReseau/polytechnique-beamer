.PHONY: all clean cleandist %.clean

TEXFILES:=$(shell find . -type f -name '*.tex')

all: $(patsubst %.tex,%.pdf,$(TEXFILES))

%.pdf: %.tex
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<

clean: $(patsubst %.tex,%.clean,$(TEXFILES))

%.clean:
	find -name '$*.*' | grep -Ev "\.tex$$|\.pdf$$" | xargs rm -f

cleandist: $(patsubst %.tex,%.cleandist,$(TEXFILES))

%.cleandist: %.clean
	rm -f $*.pdf
