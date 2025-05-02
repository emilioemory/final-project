# Final Project for Data550

This repository contains the code and data for the final project in the Data550 course. The project analyzes hospital performance across California using financial and utilization metrics from the California Health and Human Services (CHHS) Open Data Portal. 

All analysis was performed in R using R Markdown, and the project is fully reproducible via Docker or `renv`.

---

## Project Structure

- `Data550_Final_Project.Rmd`: Main report written in R Markdown.
- `Makefile`: Automates generation of the report using Docker or R locally.
- `data/`: Contains the input dataset (`2024_q3.xlsx`).
- `code/`:
  - `table1.R`: Generates `output/table_1.rds`, a summary of hospital bed availability by facility.
  - `revenue_by_county_plot.R`: Generates `output/revenue_by_county.png`, a bar chart of inpatient revenue by county and payer type.
- `output/`: Stores the generated report and intermediate files (excluded from version control via `.gitignore`).

---

## Running the Project with Docker

To generate the entire report from raw data inside a container (no local R setup needed):

```bash
make docker_report
```

## How to Reproduce the Environment with `renv`

If you're running the project locally outside Docker run the following:

```bash
make install
```