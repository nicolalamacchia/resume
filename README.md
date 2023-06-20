# Nicola's Résumé

[![Generate PDF from TeX](https://github.com/nicolalamacchia/resume/actions/workflows/build.yml/badge.svg)](https://github.com/nicolalamacchia/resume/actions/workflows/build.yml)

LaTeX code of my personal résumé. It consists of:

* a class file (`resume.cls`), which provides the page settings and custom
  colors, commands and environments
* a TeX file (`resume.tex`), which contains the page structure and sections
  with their content (it's almost completely human-readable)

## Build Process

The résumé gets built at every push to the `main` branch (only if it affects
either `resume.tex` or `resume.cls`) through GitHub actions. Refer to
`actions/build-resume/Dockerfile` for more information.

The PDF is generated using the `xelatex` compiler, based on the XeLaTeX engine,
provided by the XeTeX TeXLive package.

### Build Locally

To run a manual build, make sure the dependencies are installed:

1. use the package manager of your OS to install `tlmgr` first or install it
manually;
2. to install the required packages using `tlmgr`, run:

```
# make deps
```

Finally, to build the PDF, run:

```
$ make
```
