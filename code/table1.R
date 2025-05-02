# code/table_1.R

# loading necessary libraries
library(dplyr)
library(readxl)

# defining file path relative to project root
file_path <- file.path("data", "2024_q3.xlsx")

# reading the excel file
df <- read_excel(file_path, sheet = 1)

# creating table of bed counts by facility and renaming variables for clearer column titles
bed_summary <- df %>%
  select(FAC_NAME, LIC_BEDS, AVL_BEDS, STF_BEDS) %>%
  rename(
    `Licensed Beds` = LIC_BEDS,
    `Available Beds` = AVL_BEDS,
    `Staffed Beds` = STF_BEDS,
    `Facility Name` = FAC_NAME
  ) %>%
  arrange(`Licensed Beds`)

# creating output directory if it doesn't exist
if (!dir.exists("output")) dir.create("output")

# saving output for use in the report
saveRDS(bed_summary, file = "output/table_1.rds")