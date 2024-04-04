TEX    = xelatex
TARGET = resume.pdf

Q = @

.PHONY: default
default: $(TARGET) ## Build the default target

.PHONY: clean
clean: ## Remove output files
	rm -f *.pdf *.aux *.log *.out

.PHONY: deps
deps: ## Install dependencies
ifneq ($(shell command -v tlmgr 2> /dev/null),)
	$(error tlmgr could not be found, install it first)
else
	tlmgr update --self
	tlmgr install texliveonfly
	tlmgr install titlesec
	tlmgr install crimsonpro
	tlmgr install rosario
	tlmgr install changepage
	tlmgr install tcolorbox
	tlmgr install environ
	tlmgr install tikzfill
	tlmgr install zref
	tlmgr install xifthen
	tlmgr install ifmtarg
	tlmgr install enumitem
endif

.PHONY: open
open: $(TARGET) ## Open the generated file (for some *nix OSs)
ifneq ($(shell command -v xdg-open 2> /dev/null),)
	$(Q)xdg-open $(TARGET)
else ifneq ($(shell command -v open 2> /dev/null),)
	$(Q)open $(TARGET)
else
	$(error Could not find a proper way to open the target)
endif

.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  $(notdir $(MAKE)) \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

%.aux: %.tex %.cls
	$(TEX) $*

%.pdf: %.aux
	$(Q)sed -e "s/%BuildHash%/$(shell git rev-parse --short HEAD)-M/" $*.tex | $(TEX) -jobname $*

