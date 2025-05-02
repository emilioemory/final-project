.PHONY: all install report docker_report clean

# Default: builds the report locally
all: report

# Install packages with renv
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# Build the report locally
report: output/Data550_Final_Project.html

output/table_1.rds: code/table1.R data/2024_q3.xlsx
	Rscript code/table1.R

output/revenue_by_county.png: code/revenue_by_county_plot.R data/2024_q3.xlsx
	Rscript code/revenue_by_county_plot.R

output/Data550_Final_Project.html: Data550_Final_Project.Rmd output/table_1.rds output/revenue_by_county.png
	Rscript -e "rmarkdown::render('Data550_Final_Project.Rmd', output_file = 'Data550_Final_Project.html', output_dir = 'output')"

# Run Docker image and write report to ./report/ (must be empty or non-existent)
docker_report:
	mkdir -p report
	docker run --rm -v "$$(pwd)/report:/home/project/output" emilioestrada/final-project

# Clean all generated files
clean:
	rm -rf output/* report/*

