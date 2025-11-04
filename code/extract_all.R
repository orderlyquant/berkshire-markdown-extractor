library(rvest)
library(tidyverse)
source("code/extractor.R")

# The following doesn't work on the berkshirehathaway website, need
# manually download
# index_url <- "https://berkshirehathaway.com/letters/letters.html"
# index_page <- read_html(index_url)

# first manually save to a file
index_page <- read_html('~/Downloads/brk-shareholder-letters.html')


links <- index_page %>% html_nodes("a") %>% html_attr("href")
full_links <- links[!str_detect(links, "amazon")] %>%
  paste0("https://berkshirehathaway.com/letters/", .)
message("Found ", length(full_links), " subpages for extraction.")

# ISSUE: there is a mix of html, sublinks (html or pdf) and straight
#        pdf. Extraction needs to be rethought
for (url in full_links) {
  extract_bh_subpage(url, output_dir = "output")
}
