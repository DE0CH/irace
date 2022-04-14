FROM ubuntu:bionic
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
RUN R --slave --quiet 'install.packages("devtools", dependencies=TRUE, repos="https://cloud.r-project.org")''
RUN R --slave --quiet 'install.packages("testthat", dependencies=TRUE, repos="https://cloud.r-project.org")''
CMD make check
