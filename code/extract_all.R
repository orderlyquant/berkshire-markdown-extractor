library(rvest)
source("code/extractor.R")
index_url <- "https://berkshirehathaway.com/letters/letters.html"
index_page <- read_html(index_url)
links <- index_page %>% html_nodes("a") %>% html_attr("href")
full_links <- links[!str_detect(links, "amazon")] %>%
  paste0("https://berkshirehathaway.com/letters/", .)
message("Found ", length(full_links), " subpages for extraction.")
for (url in full_links) {
  extract_bh_subpage(url, output_dir = "output")
}