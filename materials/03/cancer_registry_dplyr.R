library(tidyverse)
library(readxl)
library(readr)

# Copied from RStudio's "Import Dataset..."
cr_patients <- read_excel("CancerRegistryDataPatients.xlsx",
                          col_types = c("numeric", "numeric", "text",
                                        "text", "text", "text", "date", "text"))

cr_patients <- read_csv("CancerRegistryDataPatients.csv",
                        col_types = cols(`Date Last Patient Contact/Dead` = col_date(format = "%m/%d/%y")))
