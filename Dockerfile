FROM rocker/tidyverse

# Set working directory *before* copying anything
WORKDIR /home/project

# Install system dependencies (needed for rmarkdown, xml, etc.)
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

# Install renv itself
RUN R -e "install.packages('renv', repos = 'https://cloud.r-project.org')"

# Copy only the files needed for reproducible builds
COPY .Rprofile ./
COPY renv.lock ./
COPY renv/ ./renv/
COPY code/ ./code/
COPY data/ ./data/
COPY Data550_Final_Project.Rmd ./
COPY Makefile ./

# Restore packages using renv
RUN Rscript -e "renv::restore(prompt = FALSE)"

# Run full pipeline from raw data → .rds/.png → HTML report
CMD ["make", "report"]
