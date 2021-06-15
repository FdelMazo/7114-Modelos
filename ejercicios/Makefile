pdfs := $(patsubst %.md,%.pdf,$(wildcard *.md))
all: $(pdfs)

%.pdf: %.md
	pandoc -s header.yml $^ -o $@

all:
	pandoc --toc -V documentclass=report -s header.yml $(sort $(wildcard *.md)) -o ejercicios.pdf
