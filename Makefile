pdfs := $(patsubst %.md,%.pdf,$(wildcard *.md))
all: $(pdfs)

%.pdf: %.md
	pandoc -s header.yml $^ -o $@

pdf:
	pandoc --toc -V documentclass=report -s header.yml $(filter-out README.md TP.md, $(sort $(wildcard *.md))) -o resueltos.pdf
