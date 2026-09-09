#!/usr/bin/env Rscript
## 00_crawl.R
## Crawl the Apache directory index at listdata.thelist.tas.gov.au/opendata/data/
## recursively and write manifest/index.csv with one row per entry.
##
## Columns: url, path, name, is_dir, bytes_listed, mtime_listed, bytes, mtime,
##          etag, crawled_at
## bytes_listed/mtime_listed come from the HTML (human units, minute precision).
## bytes/mtime/etag come from an HTTP HEAD on each file (exact). Set HEAD=0 in
## the environment to skip the HEAD pass.

suppressPackageStartupMessages({
  library(httr2)
})

ROOT <- Sys.getenv("LIST_ROOT", "https://listdata.thelist.tas.gov.au/opendata/data/")
DO_HEAD <- Sys.getenv("HEAD", "1") != "0"
OUT <- "manifest/index.csv"
dir.create("manifest", showWarnings = FALSE)

ua <- "thelist-opendata crawler (https://github.com/mdsumner)"

get_html <- function(url) {
  request(url) |>
    req_user_agent(ua) |>
    req_retry(max_tries = 4, backoff = ~ 2) |>
    req_perform() |>
    resp_body_string()
}

## Parse a mod_autoindex page. Works for both the <pre> and the <table>
## FancyIndexing layouts: split on anchors, then pull the date and size that
## follow each href. Rows without a date (header, parent dir) are dropped.
parse_index <- function(html) {
  chunks <- strsplit(html, "<a ", fixed = TRUE)[[1]][-1]
  href <- sub('^[^>]*href="([^"]+)".*$', "\\1", chunks)
  href <- gsub("&amp;", "&", href)
  href <- utils::URLdecode(href)
  dt <- regmatches(chunks, regexpr("[0-9]{2}-[A-Za-z]{3}-[0-9]{4} [0-9]{2}:[0-9]{2}", chunks))
  has_dt <- grepl("[0-9]{2}-[A-Za-z]{3}-[0-9]{4} [0-9]{2}:[0-9]{2}", chunks)
  ## size is the first token after the datetime: "-" for dirs, else e.g. 16M, 1.5G, 408
  after <- sub("^.*?[0-9]{2}-[A-Za-z]{3}-[0-9]{4} [0-9]{2}:[0-9]{2}", "", chunks)
  after <- gsub("<[^>]+>", " ", after)
  size <- sub("^\\s*(\\S+).*$", "\\1", after)
  keep <- has_dt & !grepl("^(\\?|/|\\.\\./?)", href) & href != "Parent Directory"
  data.frame(
    name = href[keep],
    is_dir = grepl("/$", href[keep]),
    bytes_listed = size[keep],
    mtime_listed = dt[cumsum(has_dt)][keep],   # dt only has matched chunks; keep implies has_dt
    stringsAsFactors = FALSE
  )
}

## "16M" -> 16*2^20 etc. Apache rounds, so this is approximate; HEAD is exact.
human_to_bytes <- function(x) {
  mult <- c(K = 2^10, M = 2^20, G = 2^30, T = 2^40)
  u <- toupper(sub("^[0-9.]+", "", x))
  n <- suppressWarnings(as.numeric(sub("[A-Za-z]+$", "", x)))
  ifelse(x == "-", NA_real_, n * ifelse(u == "", 1, mult[u]))
}

crawl <- function(url, path = "") {
  message("GET ", url)
  d <- parse_index(get_html(url))
  if (!nrow(d)) return(d)
  d$url <- paste0(url, utils::URLencode(d$name))
  d$path <- paste0(path, d$name)
  subs <- d[d$is_dir, ]
  d <- rbind(d, do.call(rbind, lapply(seq_len(nrow(subs)), function(i) {
    Sys.sleep(0.5)
    crawl(subs$url[i], subs$path[i])
  })))
  d
}

idx <- crawl(ROOT)
idx$bytes_listed <- human_to_bytes(idx$bytes_listed)
idx$mtime_listed <- format(as.POSIXct(idx$mtime_listed, format = "%d-%b-%Y %H:%M", tz = "Australia/Hobart"),
                           "%Y-%m-%dT%H:%M:%S%z")
idx$bytes <- NA_real_; idx$mtime <- NA_character_; idx$etag <- NA_character_
idx$head_status <- NA_integer_

## resume: reuse HEAD results from a previous (possibly interrupted) run for
## rows whose listed size+mtime are unchanged
if (file.exists(OUT)) {
  prev <- read.csv(OUT, stringsAsFactors = FALSE)
  if ("head_status" %in% names(prev)) {
    key <- function(d) paste(d$url, d$bytes_listed, d$mtime_listed)
    m <- match(key(idx), key(prev))
    ok <- !is.na(m) & !is.na(prev$head_status[m])
    for (col in c("bytes", "mtime", "etag", "head_status")) idx[[col]][ok] <- prev[[col]][m[ok]]
    message("resumed HEAD for ", sum(ok), " rows from previous ", OUT)
  }
}

hdr <- function(r, h) { v <- resp_header(r, h); if (is.null(v) || !length(v)) NA_character_ else v[[1]] }

if (DO_HEAD) {
  todo <- which(!idx$is_dir & is.na(idx$head_status))
  for (k in seq_along(todo)) {
    i <- todo[k]
    r <- tryCatch(
      request(idx$url[i]) |> req_user_agent(ua) |> req_method("HEAD") |>
        req_retry(max_tries = 3) |> req_error(is_error = function(resp) FALSE) |> req_perform(),
      error = function(e) NULL)
    if (is.null(r)) next
    idx$head_status[i] <- resp_status(r)
    idx$bytes[i] <- suppressWarnings(as.numeric(hdr(r, "content-length")))
    lm <- hdr(r, "last-modified")
    if (!is.na(lm)) idx$mtime[i] <- format(as.POSIXct(lm, format = "%a, %d %b %Y %H:%M:%S", tz = "GMT"),
                                           "%Y-%m-%dT%H:%M:%SZ")
    idx$etag[i] <- hdr(r, "etag")
    if (k %% 50 == 0) {
      message("HEAD ", k, "/", length(todo))
      write.csv(idx, OUT, row.names = FALSE, na = "")   # checkpoint
    }
    Sys.sleep(0.2)
  }
  bad <- idx[!idx$is_dir & (is.na(idx$head_status) | idx$head_status != 200 | is.na(idx$bytes)), ]
  if (nrow(bad)) { message(nrow(bad), " files without a clean HEAD (status/bytes):"); print(bad[, c("path", "head_status", "bytes")]) }
}

idx$crawled_at <- format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
idx <- idx[order(idx$path), c("url", "path", "name", "is_dir", "bytes_listed", "mtime_listed",
                              "bytes", "mtime", "etag", "head_status", "crawled_at")]
write.csv(idx, OUT, row.names = FALSE, na = "")
message("wrote ", OUT, ": ", nrow(idx), " entries, ",
        sum(!idx$is_dir), " files, ",
        format(sum(idx$bytes, na.rm = TRUE) / 2^30, digits = 4), " GiB (HEAD) / ",
        format(sum(idx$bytes_listed, na.rm = TRUE) / 2^30, digits = 4), " GiB (listed)")
