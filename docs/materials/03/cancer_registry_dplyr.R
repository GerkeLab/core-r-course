library(tidyverse)
library(readxl)

# Copied from RStudio's "Import Dataset..."
cr_data <- read_excel("materials/03/CancerRegistryData.xlsx",
                      col_types = c("numeric", "numeric", "text",
                                    "text", "date", "numeric", "numeric",
                                    "text", "text", "text", "text", "date",
                                    "numeric", "text", "numeric", "text",
                                    "text", "text", "text", "text", "text"))

cr_patients <- read_excel("materials/03/CancerRegistryDataPatients.xlsx",
                          col_types = c("numeric", "numeric", "text",
                                        "text", "text", "text", "date", "text"))
