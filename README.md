# Final Project for Data550

This repository contains the code and data for the final project in the Data550 course. The project involves an analysis using data from the California Health and Human Services (CHHS) Open Data Portal to assess hospital performance across California using financial and utilization data. The analysis is performed using R and R Markdown.

## Project Structure

- `Data550_Final_Project.Rmd`: The main R Markdown file that contains the code and narrative for the final report.
- `Makefile`: A file to automate the generation of the report.
- `output/`: A directory where the final report is generated.
- `data/`: A directory containing the dataset(s) used for analysis. The data is in `2024_q3.xlsx`.
- The table can be found in section # Create some table describing or showing the results of an analysis of the data.
- The figure can be found in section # Create some figure describing some element of the data#
 in the first text block generated.

## How to Generate the Final Report

To generate the final report, follow these steps:

1. Clone this repository to your local machine using Git:
   ```bash
   git clone https://github.com/emilioemory/final-project.git
   ```
## Reproducing the Environment

To install all necessary R packages for this project using `renv`:

```bash
make install
```