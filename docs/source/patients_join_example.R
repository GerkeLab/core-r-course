patients <- tibble::tribble(
  ~ id, ~ name, ~ age,
  1, "Emmet", 63,
  2, "Sheilah", 61,
  3, "Camron", 76,
  4, "Marisela", 58,
  5, "Charity", 64
)

encounters <- tibble::tribble(
         ~date, ~patient_id, ~blood_test, ~paid,
  "2018-08-08",          1L,        TRUE, FALSE,
  "2018-08-08",          3L,        TRUE,  TRUE,
  "2018-08-09",          1L,       FALSE, FALSE,
  "2018-08-10",          5L,        TRUE,  TRUE,
  "2018-08-11",          3L,        TRUE, FALSE,
  "2018-08-13",          1L,       FALSE,  TRUE,
  "2018-08-13",          2L,        TRUE, FALSE,
  "2018-08-13",          5L,        TRUE, FALSE,
  "2018-08-13",          3L,       FALSE, FALSE,
  "2018-08-13",          5L,       FALSE,  TRUE
)

insurance <- tibble::tribble(
  ~patient_id, ~insurance,
           5L,    "Other",
           4L,    "Other",
           1L,    "Aetna",
           2L,     "BCBS"
  )


# https://git.io/fNNQx
