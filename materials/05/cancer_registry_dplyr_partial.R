library(tidyverse)
library(readxl)
library(readr)


#### Import Data ####

# Copy from RStudio's "Import Dataset..."
cr_patients <- read_excel("CancerRegistryDataPatients.xlsx",
                          col_types = c("numeric", "numeric", "text",
                                        "text", "text", "text", "date", "text"))

# Import the CSV file using `read_csv()`:
cr_patients <- read_csv("CancerRegistryDataPatients.csv", 
                        col_types = cols(`Date Last Patient Contact/Dead` = col_date(format = "%m/%d/%y")))

#### View Data ####

# View(cr_patients)
glimpse(cr_patients)
head(cr_patients)
tail(cr_patients)
nrow(cr_patients)
names(cr_patients)





#### How many of each? ####

# How many of each: `Sex`?
count(cr_patients, Sex)

# How many of each: `Spanish/Hispanic Origin`?
count(cr_patients, `Spanish/Hispanic Origin`, sort = TRUE)

# How many of each: `Race`?
count(cr_patients, Race)

# How many of each: `Vital Status` + `DC, Cause of Death`?
count(cr_patients, `DC, Cause of Death`)

count(cr_patients, `Vital Status`, `DC, Cause of Death`)




#### Rename ####

# To make things easier, rename the columns representing `cause_of_death`
# and `vital_status`.

cr_patients_orig <- cr_patients

cr_patients <- cr_patients %>%
  rename(vital_status = `Vital Status`,
         cause_of_death = `DC, Cause of Death`)




#### Fix Coding Issues ####


# Create a new variable called `hispanic` that is `TRUE` if
# `Spanish/Hispanic Origin` is not equal to `NON-SPANISH(0)` or `UNKNOWN(9)`.

non_hispanic <- c("NON-SPANISH(0)", "UNKNOWN(9)")

cr_patients <- cr_patients %>%
  mutate(hispanic = !(`Spanish/Hispanic Origin` %in% non_hispanic))

# cr_patients %>% 
#   mutate(hispanic2 = !(`Spanish/Hispanic Origin` == "NON-SPANISH(0)" | `Spanish/Hispanic Origin` == "UNKNOWN(9)")) %>% 
#   count(hispanic, hispanic2)


# Recode `vital_status`: replace the value `"NONE"` with a missing value.
# To do this, you can use the helper function `na_if()` from dplyr.

cr_patients <- cr_patients %>%
  mutate(vital_status = na_if(vital_status, "NONE"))


# Fix the following two issues with `cause_of_death` using a single `mutate()`.
#
# 1. The death certificate was not available for one patient (who was coded as
#    `"7777"`), but the certificate has been found and the code should be `"C508"`.
#
# 2. If the patient is still alive but cause of death is missing, then the
#    value should be `"0"`.

cr_patients <- cr_patients %>%
  mutate(
    cause_of_death = recode(cause_of_death, "7777" = "C508"),
    cause_of_death = if_else(vital_status == "ALIVE" & is.na(cause_of_death), "0", cause_of_death)
  )





#### Task 1 ####



##### Task 1-A #####

# For this task, the following request was made:
#
# 1. Caucasian, non-hispanic patients,
# 2. who are still alive
# 3. at least 55 or older
# 4. ordered by most recent contact
# 5. with only the columns `MRN`, `Age`, and `Last Contact`

task1 <- cr_patients %>%
  filter(
    Race == "WHITE", 
    !hispanic, 
    vital_status == "ALIVE",
    `Age, Current` >= 55
  ) %>% 
  arrange(desc(`Date Last Patient Contact/Dead`)) %>% 
  select(
    MRN = `Medical Record Number`, 
    Age = `Age, Current`,
    `Last Contact` = `Date Last Patient Contact/Dead`)

# Create a folder called "output_04" in your project and save the output into
# the folder as a CSV file using `write_csv()`.

dir.create("output_04")

write_csv(task1, "output_04/task1.csv")



##### Task 1-B #####

# Copy the code from **Task 1-A** and then modify it to include only patients
# who were contacted since January 1, 2017. Export your results to a CSV file.

task1b <- cr_patients %>%
  filter(
    Race == "WHITE", 
    !hispanic, 
    vital_status == "ALIVE",
    `Age, Current` >= 55,
    `Date Last Patient Contact/Dead` >= "2017-01-01"
  ) %>% 
  arrange(desc(`Date Last Patient Contact/Dead`)) %>% 
  select(
    MRN = `Medical Record Number`, 
    Age = `Age, Current`,
    `Last Contact` = `Date Last Patient Contact/Dead`)

write_csv(task1b, "output_04/task1b.csv")




#### Task 2 ####



##### Task 2-A #####

# Calculate the average age of patients by race, vital status, and hispanic
# origin. Again, save your results as a CSV file.

task2a <- cr_patients %>%
  group_by(Race, vital_status, hispanic) %>%
  summarize(age = mean(`Age, Current`))

write_csv(task2a, "output_04/task2a.csv")


##### Task 2-B #####

# In addition to the average age, report the minimum, maximum and count of
# patients in each group from Task 2-A. For the count, this time you can use
# the function `n()`.

task2b <- cr_patients %>%
  ________



##### Task 2-C #####

# Calculate the average age of patients by year of last contact. To do this, you
# can load the `lubridate` package and use the function `year()` on any columns
# with dates.

________(lubridate)

task2c <- cr_patients %>%
  ________





#### Task 3 ####

# Export a CSV containing the following information:
#
# 1. Patients who
#     - Are deceased
#     - At least 55 years or older
# 2. Race recoded as "Caucasian" or "Other"
# 3. Ordered by MRN
# 4. With the columns
#     - MRN
#     - Age
#     - Race
#     - CoD

task3 <- cr_patients %>%
  ________






#### Bonus Challenge ####

# Read in the data file `CancerRegistryData.csv` and answer the following questions:
#
# In which year were the most patients diagnosed?
#
# What is the average, minimum and maximum age at diagnosis in each year?
#
# Do all of the values from the previous question make sense? If not, fix or
# remove the patients with bad values in the next step.
#
# What is the average age at diagnosis, average survival time in years and
# number of patients diagnosed for each primary cancer site, ordered by highest
# prevalence first?


CancerRegistryData <- ________
