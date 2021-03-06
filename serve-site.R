#!/usr/bin/env Rscript
setwd(here::here())
library(tictoc)

render <- function(x, quiet = TRUE) {
  if (grepl("site_libs", x)) return()
  tic("Update complete")
  cli::cat_bullet("Update started:  ", x, col = "yellow", bullet_col = "yellow")
  if (any(grepl("slides\\.Rmd$", x))) {
    purrr::walk(x[grepl("slides\\.Rmd$", x)], rmarkdown::render)
    rmarkdown::render_site(quiet = quiet)
  } else rmarkdown::render_site(quiet = quiet)
  cli::cat_bullet(capture.output(toc()), col = "green", bullet_col = "green", bullet = "tick")
}

render("index.Rmd")
servr::httw(handler = render, pattern = "\\.(R?md|yml|css)", host = "127.0.0.1")
