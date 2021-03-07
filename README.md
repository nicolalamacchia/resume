# Nicola's Résumé

LaTeX code of my personal résumé. It consists of:

* a class file (`resume.cls`), which provides the page settings and custom
  colors, commands and environments
* a TeX file (`resume.tex`), which contains the page structure and sections
  (it's almost completely human-readable)

## Build process

The résumé gets built at every push on the `main` branch through GitHub
actions. Refer to `actions/build-resume/Dockerfile` for more information.

The PDF is generated using the `xelatex` compiler, based on the XeLaTeX engine,
provided by the XeTeX TeXLive package.

