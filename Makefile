TEX=xelatex

.PHONY: default
default: resume.pdf ## Build the default target

.PHONY: clean
clean: ## Remove output files
	rm -f *.pdf *.aux *.log *.out

.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

%.pdf: %.tex %.cls
	@sed -e "s/%BuildHash%/$(shell git rev-parse --short HEAD)-M/" $*.tex | $(TEX) -jobname $*
