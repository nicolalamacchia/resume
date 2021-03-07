FROM ubuntu:latest
LABEL "maintainer"="Nicola Lamacchia <github@nicola.dev>"
LABEL "repository"="https://github.com/nicolalamacchia/resume-action"
LABEL "homepage"="https://github.com/nicolalamacchia/resume-action"
LABEL "com.github.actions.name"="Convert TeX to PDF"
LABEL "com.github.actions.description"="Convert documents to PDF using xelatex."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="blue"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-english \
    texlive-xetex && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
