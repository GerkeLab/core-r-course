library(tidyverse)


# Import Data -------------------------------------------------------------

# If you don't have the data in your working directory, you can download it by
# uncommenting and running the two lines below.
# download.file("https://git.io/fATNV", "CancerRegistryData.csv")
# download.file("https://git.io/fATNo", "CancerRegistryDataPatients.csv")

cr_patients <- read_csv(
  "CancerRegistryDataPatients.csv",
  col_names = c("mrn", "age_current", "sex", "hispanic_origin", "race", "vital_status", "date_last_contact", "cause_of_death"),
  col_types = cols(date_last_contact = col_date(format = "%m/%d/%y")),
  skip = 1
)

cr <- read_csv(
  "CancerRegistryData.csv",
  col_names = c("mrn", "sequence", "site_primary_icd_o_3",
                "histology_behavior_icd_o_3", "date_diagnosis", "age_diagnosis",
                "age_current", "sex", "hispanic_origin", "race", "vital_status",
                "date_last_contact", "survival_time", "cause_of_death",
                "tumor_size", "size_unit", "tobacco_use",
                "summary_rx", "payer_source_dx", "patient_history_alcohol",
                "marital_status_dx"),
  col_types = cols(
    date_last_contact = col_date(format = "%m/%d/%y"),
    date_diagnosis = col_date(format = "%m/%d/%y")
  ),
  skip = 1
)
