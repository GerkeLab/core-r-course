library(tidyverse)
table_6a <- tibble::tribble(
  ~mrn, ~sequence, ~age, ~tumor_size, ~tumor_unit,
  289034L,        1L,  47L,         0.9,        "cm",
  289034L,        2L,  47L,         999,        "mm",
  290660L,        1L,  49L,          30,        "mm",
  290660L,        2L,  49L,         999,        "mm",
  341050L,        1L,  61L,         999,        "mm",
  341050L,        2L,  70L,         2.1,        "cm",
  385615L,        1L,  71L,          12,        "mm",
  385615L,        2L,  71L,           2,        "cm",
  550955L,        1L,  43L,         2.5,        "cm",
  550955L,        2L,  43L,         998,        "mm"
)

table_6b <-
  table_6a %>%
  mutate(tumor_size = paste(tumor_size, tumor_unit)) %>%
  select(-tumor_unit) %>%
  gather(type, value, age:tumor_size) %>%
  arrange(mrn, sequence)

table_6c <-
  table_6a %>%
  mutate(age = paste0(age, " (", sequence, ")")) %>%
  select(-sequence)

table_6d1 <-
  table_6a %>%
  select(mrn, sequence, age) %>%
  spread(sequence, age)

table_6d2 <-
  table_6a %>%
  mutate(tumor_size = paste(tumor_size, tumor_unit)) %>%
  select(mrn, sequence, tumor_size) %>%
  spread(sequence, tumor_size)

table_6e <-
  t(table_6a) %>%
  as.data.frame(stringsAsFactors = FALSE) %>%
  rownames_to_column("var") %>%
  as_tibble() %>%
  mutate_all(str_trim) %>%
  {
    colnames(.) <- paste(c("var", .[1, -1]))
    .[-1, ]
  }
