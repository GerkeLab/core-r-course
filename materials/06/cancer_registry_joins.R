library(tidyverse)


# Import Data -------------------------------------------------------------

# If you don't have the data in your working directory, you can download it by
# uncommenting and running the two lines below.
# download.file("https://git.io/fATNV", "CancerRegistryData.csv")
# download.file("https://git.io/fATNo", "CancerRegistryDataPatients.csv")

cr_patients <- read_csv(
  "CancerRegistryDataPatients.csv",
  col_types = cols(`Date Last Patient Contact/Dead` = col_date(format = "%m/%d/%y"))
)

cr <- read_csv(
  "CancerRegistryData.csv",
  col_types = cols(
    `Date Last Patient Contact/Dead` = col_date(format = "%m/%d/%y"),
    `Date of Diagnosis` = col_date(format = "%m/%d/%y")
  )
)


# Task 1 ------------------------------------------------------------------

# Merge the two data sets to add the patient information from `cr_patients` to
# the corresponding diagnosis records in `cr`

_____join(_____, _____, by = "Medical Record Number")




# Task 2 ------------------------------------------------------------------

# Find deceased patients at least 75 years or older. Create a data frame
# containing their patient information and all of their diagnosis records.

task2_patients <- cr_patients %>%
  ___________

_____join(task2_patients, cr, by = "Medical Record Number")




# Task 3 ------------------------------------------------------------------

# Find the diagnosis records of the African American patients.

task3_patients <- cr_patients %>%
  __________

_____join(cr, ________, by = "Medical Record Number")


# BONUS: Find the diagnosis records of married African American patients.




# Task 4 ------------------------------------------------------------------

# Find all patients who have had more than one cancer diagnosis and create a
# data frame with only their patient information, using `anti_join()`.

_________ <- cr %>%
  _________

anti_join(_________, _________, by = "Medical Record Number")




# Task 5 ------------------------------------------------------------------

# Find patients who were last contacted in 2017 and merge their patient
# information with their diagnosis records. Transform all dates to be the number
# of days since their earliest diagnosis.

library(lubridate)

# Find patients last contacted in 2017
task5_selected <- cr_patients %>%
  _________

# Create a data frame with patient and earliest diagnosis
task5_first_dx <- cr %>%
  group_by(________) %>%
  summarize(first_diagnosis = min(________))

# Merge task5_selected and task5_first_dx so that selected patients also have
# a `first_diagnosis` column
task5_patients <- _____join(task5_selected, task5_first_dx, by = "Medical Record Number")

# Then join patient information and diagnosis records and transform dates.
_________(task5_patients, _________, by = "Medical Record") %>%
  mutate(
    `Date Last Patient Contact/Dead` = ________,
    `Date of Diagnosis` = ________
  )
