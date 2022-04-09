FROM ubuntu:focal
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y \ 
    r-base \ 
    texinfo \ 
    texlive \
    texlive-latex-extra \
    texlive-science \ 
    cm-super
RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org")'
COPY . . 
RUN R CMD INSTALL .
WORKDIR /usr/app
