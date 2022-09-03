FROM rocker/r-base

RUN install2.r --error \
    -r "https://cran.rstudio.com" \
    Rserve && \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY rserve.conf .
COPY init.R .

ENTRYPOINT R -f init.R
