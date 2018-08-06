library(tidyverse)
library(readxl)
library(readr)


#' #### Import Data ####

#' Copied from RStudio's "Import Dataset..."
cr_patients <- read_excel("CancerRegistryDataPatients.xlsx",
                          col_types = c("numeric", "numeric", "text",
                                        "text", "text", "text", "date", "text"))

cr_patients <- read_csv("CancerRegistryDataPatients.csv",
                        col_types = cols(`Date Last Patient Contact/Dead` = col_date(format = "%m/%d/%y")))

#' ---- View Data ----
# View(cr_patients)
glimpse(cr_patients)

#' ---- How Many of Each? ----

#' How many of each: `Sex`?
count(cr_patients, Sex)

#' How many of each: `Spanish/Hispanic Origin`?
count(cr_patients, `Spanish/Hispanic Origin`)

#' How many of each: `Race`?
count(cr_patients, Race)

#' How many of each: `Vital Status` + `DC, Cause of Death`?
count(cr_patients, `Vital Status`, `DC, Cause of Death`)


#' ---- Rename ----
cr_patients <- cr_patients %>%
  rename(cause_of_death = `DC, Cause of Death`,
         vital_status = `Vital Status`)

#' ---- Fix Coding Issues ----

#' Create a new variable called `hispanic` that is `FALSE` if
#' `Spanish/Hispanic Origin` is not equal to `NON-SPANISH(0)` or `UNKNOWN(9)`.
cr_patients <- cr_patients %>%
  mutate(hispanic = !(`Spanish/Hispanic Origin` %in% c("NON-SPANISH(0)", "UNKNOWN(9)")))

#' Recode `vital_status`: replace the value `"NONE"` with a missing value.
#' To do this, you can use the helper function `na_if()` from dplyr.
cr_patients <- cr_patients %>%
  mutate(vital_status = na_if(vital_status, "NONE"))

#' Fix the following two issues with `cause_of_death` using a single `mutate()`.
#'
#' 1. The death certificate was not available for one patient (who was coded as
#'    `"7777"`), but the certificate has been found and the code should be `"C508"`.
#'
#' 2. If the patient is still alive but cause of death is missing, then the
#'    value should be `"0"`.

cr_patients <- cr_patients %>%
  mutate(
    cause_of_death = recode(cause_of_death, "7777" = "C508"),
    cause_of_death = if_else(is.na(cause_of_death) & vital_status == "ALIVE", "0", cause_of_death)
  )

