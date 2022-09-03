FROM rocker/r-base

RUN install2.r --error \
    -r "https://cran.rstudio.com" \
    Rserve && \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY rserve.conf .
COPY init.R .

EXPOSE 8000
ENTRYPOINT R -f init.R
