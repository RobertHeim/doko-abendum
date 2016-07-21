TARGET=addendum.pdf

OUTDIR=out

SOURCES=addendum.tex


### DON'T CHANGE ###

all:
	mkdir -p $(OUTDIR)
	@pdflatex -aux-directory=$(OUTDIR) -output-directory=$(OUTDIR) $(TARGET:.pdf=) warnings

clean:
	@rm -rf $(OUTDIR)

warnings:
	@-echo -------------------------- Warnings from latex
	@-grep -e [Ww]arning: $(OUTDIR)/$(TARGET:.pdf=.log)
