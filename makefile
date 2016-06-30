TARGET=abendum.pdf

OUTDIR=out/

SOURCES=abendum.tex


### DON'T CHANGE ###

all:
	mkdir -p $(OUTDIR)
	@pdflatex -aux-directory=$(OUTDIR) -output-directory=$(OUTDIR) $(TARGET:.pdf=) warnings

clean:
	@rm -rf $(OUTDIR)

warnings:
	@-echo -------------------------- Warnings from latex
	@-grep arning: $(TARGET:.pdf=.log)
