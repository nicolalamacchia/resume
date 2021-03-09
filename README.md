# Nicola's Résumé

[![Generate PDF from TeX](https://github.com/nicolalamacchia/resume/actions/workflows/build.yml/badge.svg)](https://github.com/nicolalamacchia/resume/actions/workflows/build.yml)

LaTeX code of my personal résumé. It consists of:

* a class file (`resume.cls`), which provides the page settings and custom
  colors, commands and environments
* a TeX file (`resume.tex`), which contains the page structure and sections
  with their content (it's almost completely human-readable)

## Build process

The résumé gets built at every push on the `main` branch (only if it affects
either `resume.tex` or `resume.cls`) through GitHub actions. Refer to
`actions/build-resume/Dockerfile` for more information, especially on the
needed dependencies (since they vary according to the OS and TeX distribution,
I'm not listing them here).

The PDF is generated using the `xelatex` compiler, based on the XeLaTeX engine,
provided by the XeTeX TeXLive package.

To build it manually, just run `make` (the TeX engine and the necessary TeX
packages need to be installed first).

