library(dplyr)
library(tibble)

# Functions
fun_section_header <- function(session_title, settion_time, session_zoom) {
  tibble(
    title = session_title,
    time = session_time,
    zoom = session_zoom
  ) %>%
    mutate(
      section_header = paste0(
        session_title, " ",
        "(", session_time, ")",
        if_else(session_zoom != "", 
                paste0("  ", "[Zoom](", session_zoom, ")"),
                ""
        )
      )
    ) %>%
    pull(section_header) -> section_header
  return(section_header)
}


# Build
rmarkdown::render_site()
