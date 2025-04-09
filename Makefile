# Makefile for generating final report

report: Data550_Final_Project.Rmd
    Rscript -e "rmarkdown::render('Data550_Final_Project.Rmd', output_dir = 'output')"
