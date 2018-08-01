library(tidyverse)

patient_id <- 5554321
age_at_diagnosis <- 54
age_at_visit <- 54:58
tumor_size <- c(9.5, 9.5, 9.7, 9.9, 10.1)
site_code <- c("C220", "C400", "C412", "C220", "C400")

example <- data_frame(
  patient_id = patient_id,
  age_dx = age_at_diagnosis,
  age_visit = age_at_visit,
  tumor_size = tumor_size,
  site_code = site_code
)
