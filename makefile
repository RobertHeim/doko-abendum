TARGET=addendum.pdf

OUTDIR=out

SOURCES=addendum.tex


### DON'T CHANGE ###

all: outdir
	@pdflatex -aux-directory=$(OUTDIR) -output-directory=$(OUTDIR) $(TARGET:.pdf=) warnings

# you'll need latexmk and mupdf installed on a unix-like system for this target to work
latexmk: outdir $(SOURCES)
	@latexmk -outdir=$(OUTDIR) -auxdir=$(OUTDIR) -e '$$pdf_previewer="start mupdf"; $$pdf_update_method=2; $$pdf_update_signal="SIGHUP";' -pvc -pdf $(SOURCES)

outdir:
	@mkdir -p $(OUTDIR)

clean:
	@rm -rf $(OUTDIR)

warnings:
	@echo -------------------------- Warnings from latex
	@grep -e "[Ww]arning:" $(OUTDIR)/$(TARGET:.pdf=.log); if [ $$? -eq 1 ]; then echo "no warnings :)"; fi
	@echo --------------------------
