pdfs := $(patsubst %.md,%.pdf,$(wildcard *.md))
all: $(pdfs)

%.pdf: %.md
	pandoc -s header.yml $^ -o $@
