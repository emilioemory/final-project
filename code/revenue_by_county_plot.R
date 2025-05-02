# code/revenue_by_county.png

# loading necessary libraries
library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)
library(readxl)

# defining file path relative to project root
file_path <- "data/2024_q3.xlsx"

# reading the excel file
df <- read_excel(file_path, sheet = 1)

# aggregating gross inpatient revenue by county
county_revenue <- df %>%
  filter(COUNTY_NAME != "N/A") %>%  # removing blank "N/A" COUNTY_NAME data from plot
  group_by(COUNTY_NAME) %>%
  summarise(
    GRIP_MCAR = sum(GRIP_MCAR, na.rm = TRUE),
    GRIP_MCAR_MC = sum(GRIP_MCAR_MC, na.rm = TRUE),
    GRIP_MCAL = sum(GRIP_MCAL, na.rm = TRUE),
    GRIP_MCAL_MC = sum(GRIP_MCAL_MC, na.rm = TRUE)
  ) %>%
  pivot_longer(
    cols = -COUNTY_NAME,
    names_to = "payer",
    values_to = "revenue"
  ) %>%
  mutate(
    payer = case_when(
      payer == "GRIP_MCAL" ~ "Medi-Cal - Traditional",
      payer == "GRIP_MCAL_MC" ~ "Medi-Cal - Managed Care",
      payer == "GRIP_MCAR" ~ "Medicare - Traditional",
      payer == "GRIP_MCAR_MC" ~ "Medicare - Managed Care",
      TRUE ~ payer
    )
  )

# creating the bar plot for all counties with scaled axes
revenue_plot <- ggplot(county_revenue, aes(x = COUNTY_NAME, y = revenue, fill = payer)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Gross Inpatient Revenue by County",
    x = "County",
    y = "Revenue ($)",
    fill = "Payer Type"
  ) +
  scale_y_continuous(labels = label_comma()) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), text = element_text(size = 5))

# saving the plot to the output directory
ggsave(
  filename = "output/revenue_by_county_plot.png",
  plot = revenue_plot,
  width = 8,
  height = 6,
  dpi = 300,
  bg = "white"
)