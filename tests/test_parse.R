## Rscript tests/test_parse.R
## Exercises parse_index() and human_to_bytes() from 00_crawl.R against the
## fixture (a verbatim-shaped sample of the live listing), without network.
src <- readLines("R/00_crawl.R")
## source only the function definitions
eval(parse(text = src[grep("^parse_index <- function", src):(grep("^crawl <- function", src) - 1)]))
d <- parse_index(paste(readLines("tests/index_fixture.html"), collapse = "\n"))
print(d)
stopifnot(nrow(d) == 11,
          sum(d$is_dir) == 2,
          d$bytes_listed[d$name == "CHM_2M_STATEWIDE.zip"] == "24G",
          d$mtime_listed[d$name == "data.7z"] == "27-Aug-2020 11:42",
          d$bytes_listed[d$name == "LIST_TASVEG_50_STATEWIDE/"] == "-",
          human_to_bytes("8.1G") == 8.1 * 2^30,
          human_to_bytes("408") == 408,
          is.na(human_to_bytes("-")))
cat("ok\n")
