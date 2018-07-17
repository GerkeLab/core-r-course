library(xaringanthemer)
duo_accent(
  outfile = here::here("slides/moffitt-theme.css"),
  primary_color        = "#00589A",
  secondary_color      = "#82c878",
  inverse_header_color = "white",
  inverse_text_color   = "white",
  text_font_size       = "24px",
  text_font_google     = google_font("Roboto", "400", "300"),
  header_font_google   = google_font("Roboto Slab", "400", "300", "300i"),
  code_font_google     = google_font("IBM Plex Mono"),
  text_font_weight     = "400",
  text_slide_number_font_size = "15px",
  extra_css = list(
    ".remark-slide-content" = list(padding = "0px 70px 0 50px"),
    '.title-slide' = list(
      "text-align" = "left"
    ),
    ".title-slide h1" = list(
      "margin-bottom" = "4em"
    ),
    ".pkg" = list(
      "color"             = "#53804d",
      "font-weight"       = 300,
      "font-size"         = "95%",
      "font-family"       = "IBM Plex Mono",
      padding             = "1px 4px",
      "background-color"  = "#eff4ef",
      "border-radius"     = "4px",
      "border"            = "1px solid #82c878"
    ),
    ".hl" = list(
      "background-color" = "rgba(255, 255, 0, 0.5)",
      padding            = "1px 4px"
    ),
    ".footer" = list(
      position = "absolute",
      bottom = "3%",
      left = "5%",
      opacity = "75%"
    )
  )
)
