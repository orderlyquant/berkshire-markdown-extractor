extract_bh_subpage <- function(url, output_dir = "output") {
  library(tidyverse)
  library(rvest)

  result <- tryCatch(
    {
      # Read the page and extract its title and main content
      page <- read_html(url)
      title <- page %>% html_node("title") %>% html_text(trim = TRUE)
      # Remove Amazon sales link
      tables <- page %>% html_nodes("table")
      tables <- tables[
        !vapply(
          tables,
          function(t) {
            any(str_detect(html_text(t), "Amazon"))
          },
          logical(1)
        )
      ]
      content_text <- page %>% html_nodes("body") %>% html_text(trim = TRUE)
      md <- paste0(
        "# ",
        title,
        "\n\n",
        "**Source URL:** ",
        url,
        "\n",
        "**Extraction date:** ",
        Sys.Date(),
        "\n\n",
        content_text
      )
      file_name <- basename(url) %>%
        str_replace_all("\\.html?$", "") %>%
        paste0(".md")
      file_path <- file.path(output_dir, file_name)
      if (!dir.exists(output_dir)) {
        dir.create(output_dir, recursive = TRUE)
      }
      writeLines(md, file_path)
      message("Extracted: ", file_path)
      TRUE
    },
    error = function(e) {
      message("Failed for: ", url, " Error: ", e$message)
      FALSE
    }
  )
  invisible(result)
}
