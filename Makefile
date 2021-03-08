TEX=xelatex

.PHONY: default
default: resume.pdf

.PHONY: clean
clean:
	@rm *.pdf *.aux *.log *.out

%.pdf: %.tex %.cls
	@sed -e "s/%BuildHash%/$(shell git rev-parse --short HEAD)-M/" $*.tex | $(TEX) -jobname $*

