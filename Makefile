# Makefile for generating final report

install:
    Rscript -e 'renv::restore()'

report: Data550_Final_Project.Rmd
    Rscript -e "rmarkdown::render('Data550_Final_Project.Rmd', output_dir = 'output')"
