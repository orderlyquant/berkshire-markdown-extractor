# Berkshire Markdown Extractor

This project extracts Berkshire Hathaway shareholder letter subpages from [this index](https://berkshirehathaway.com/letters/letters.html), saving each as a markdown file (with metadata) in `output/`.

## Prerequisites

- R (>= 4.0)
- [tidyverse](https://www.tidyverse.org/)  
- [rvest](https://rvest.tidyverse.org/)
- [markdown](https://cran.r-project.org/web/packages/markdown/index.html)

Install R packages if needed:
```r
install.packages(c("tidyverse", "rvest", "markdown"))
```

## Usage

1. Run from the repo root:
   ```r
   source("code/extract_all.R")
   ```

Markdown files will be written to the `output/` folder.

## Files

- `code/extractor.R`: Extraction function (single URL to markdown file)
- `code/extract_all.R`: Iterates all relevant subpages; calls extractor
