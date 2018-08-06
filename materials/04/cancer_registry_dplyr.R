library(tidyverse)
library(readxl)
library(readr)


#### Import Data ####

#' Copied from RStudio's "Import Dataset..."
cr_patients <- read_excel("CancerRegistryDataPatients.xlsx",
                          col_types = c("numeric", "numeric", "text",
                                        "text", "text", "text", "date", "text"))

cr_patients <- read_csv("CancerRegistryDataPatients.csv",
                        col_types = cols(`Date Last Patient Contact/Dead` = col_date(format = "%m/%d/%y")))

#' ---- View Data ----
# View(cr_patients)
glimpse(cr_patients)
head(cr_patients)
tail(cr_patients)
nrow(cr_patients)
names(cr_patients)

#' ---- How Many of Each? ----

#' How many of each: `Sex`?
count(cr_patients, Sex)

#' How many of each: `Spanish/Hispanic Origin`?
count(cr_patients, `Spanish/Hispanic Origin`)

#' How many of each: `Race`?
count(cr_patients, Race)

#' How many of each: `Vital Status` + `DC, Cause of Death`?
count(cr_patients, `Vital Status`, `DC, Cause of Death`)


#' ## Rename
#'
#' To make things easier, rename the columns representing `cause_of_death`,
#' `vital_status`.
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

#' ## Task 1
#'
#' ### Task 1-A
#'
#' For this task, the following request was made:
#'
#' 1. Caucasian, non-hispanic patients,
#' 2. who are still alive
#' 3. at least 55 or older
#' 4. ordered by most recent contact
#' 5. with only the columns `MRN`, `Age`, and `Last Contact`

task1 <- cr_patients %>%
  filter(Race == "WHITE",
         vital_status == "ALIVE",
         `Age, Current` >= 55) %>%
  arrange(desc(`Date Last Patient Contact/Dead`)) %>%
  select(MRN = `Medical Record Number`,
         Age = `Age, Current`,
         `Last Contact` = `Date Last Patient Contact/Dead`)

#' Create a folder called "output_04" in your project and save the output into
#' the folder as a CSV file using `write_csv()`.
write_csv("output_04/task1a.csv")


#' ### Task 1-B
#'
#' Copy the code from **Task 1-A** and then modify it to include only patients
#' who were contacted since January 1, 2017. Export your results to a CSV file.
#task1b <-
cr_patients %>%
  filter(Race == "WHITE",
         vital_status == "ALIVE",
         `Age, Current` >= 55,
         `Date Last Patient Contact/Dead` >= "2017-01-01") %>%
  arrange(desc(`Date Last Patient Contact/Dead`)) %>%
  select(MRN = `Medical Record Number`,
         Age = `Age, Current`,
         `Last Contact` = `Date Last Patient Contact/Dead`)

#' ## Task 2
#'
#' ### Task 2-A
#'
#' Calculate the average age of patients by race, vital status, and hispanic
#' origin. Again, save your results as a CSV file.
# task2a <-
cr_patients %>%
  group_by(Race, vital_status, hispanic) %>%
  summarize(avg_age = mean(`Age, Current`))

#' ### Task 2-B
#'
#' In addition to the average age, report the minimum, maximum and count of
#' patients in each group from Task 2-A. For the count, this time you can use
#' the function `n()`.
# task2b <-
cr_patients %>%
  group_by(Race, vital_status, hispanic) %>%
  summarize(avg_age = mean(`Age, Current`),
            min_age = min(`Age, Current`),
            max_age = max(`Age, Current`),
            n = n())

#' ### Task 2-C
#'
#' Calculate the average age of patients by year of last contact. To do this, you
#' can load the `lubridate` package and use the function `year()` on any columns
#' with dates.
library(lubridate)
#task2c <-
cr_patients %>%
  mutate(year = year(`Date Last Patient Contact/Dead`)) %>%
  group_by(year) %>%
  summarize(avg_age = mean(`Age, Current`))
