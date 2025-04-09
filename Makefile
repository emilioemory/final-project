# Makefile for generating final report

report:
    Rscript -e "rmarkdown::render('Data550_Final_Project.Rmd')"
