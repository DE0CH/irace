FROM ubuntu:bionic
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y r-base
RUN apt-get install -y git
RUN apt-get install -y texinfo 
RUN apt-get install -y texlive
RUN apt-get install -y texlive-fonts-extra
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y texlive-science 
RUN apt-get install -y cm-super
RUN apt-get install -y r-cran-devtools
RUN apt-get install -y libcurl4-gnutls-dev 
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y python3-pip
WORKDIR /usr/app
COPY . .
RUN git clone https://github.com/iridia-ulb/references vignettes/optbib
RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org")'
RUN Rscript -e 'install.packages("testthat", repos="https://cloud.r-project.org")'
CMD make check
