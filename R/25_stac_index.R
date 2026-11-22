#!/usr/bin/env Rscript
## 25_stac_index.R
## A flat index of a static STAC catalogue: <STAC_OUT>/collections.parquet,
## GeoParquet with one row per asset of every collection and item (the data
## files, tiles, styles, thumbnails, items.parquet mirrors), so a client can
## list everything with one read instead of walking every catalog.json,
## collection.json and item.
##
##   SELECT collection, href FROM 'collections.parquet' WHERE list_contains(roles, 'data')
##
## Generic: it follows the child and item links from <STAC_OUT>/catalog.json
## and needs nothing from this repo. Relative hrefs are made absolute against
## STAC_BASE, where the catalogue is published (the store copy, so the index is
## the same wherever it is read from). Columns:
##   collection, collection_title, path (collection folder from the root),
##   item (NULL for collection assets), asset (asset key), asset_title, roles,
##   media_type, href, proj_code, proj_bbox, proj_shape, row_count,
##   column_names, file_size, file_checksum, license, keywords,
##   datetime (item datetime, else the collection's temporal start) and updated (UTC),
##   collection_href, description, geometry (lon/lat bbox: the item's, else
##   the collection's).
##
##   Rscript R/25_stac_index.R          # after R/22_stac.R and portolan stac-geoparquet (make stac)

suppressPackageStartupMessages({ library(jsonlite); library(duckdb) })

STAC_OUT  <- Sys.getenv("STAC_OUT", "site/stac")
STAC_BASE <- sub("/$", "", Sys.getenv("STAC_BASE", "https://data.source.coop/mdsumner/thelist-opendata/stac"))
INDEX     <- Sys.getenv("STAC_INDEX", file.path(STAC_OUT, "collections.parquet"))

## a link or asset href, relative to the folder `dir` (from the root), as a path from the root; absolute URLs unchanged
resolve <- function(href, dir) {
  if (grepl("^[A-Za-z][A-Za-z0-9+.-]*:", href)) return(href)
  out <- character()
  for (p in c(if (nzchar(dir)) strsplit(dir, "/")[[1]], strsplit(href, "/")[[1]]))
    if (p == "..") out <- head(out, -1) else if (!p %in% c(".", "")) out <- c(out, p)
  paste(out, collapse = "/")
}
absolute <- function(href, dir) { r <- resolve(href, dir); if (grepl("^[A-Za-z][A-Za-z0-9+.-]*:", r)) r else paste0(STAC_BASE, "/", r) }
read_stac <- function(rel) fromJSON(file.path(STAC_OUT, rel), simplifyVector = FALSE)
dir_of <- function(rel) { d <- dirname(rel); if (d == ".") "" else d }
or_na <- function(x) if (is.null(x)) NA else x
arr <- function(x, f = as.character) if (is.null(x)) NA else I(f(unlist(x)))
bbox4 <- function(b) { b <- as.numeric(unlist(b)); if (length(b) == 6) b[c(1, 2, 4, 5)] else if (length(b) == 4) b else NULL }

asset_rows <- function(assets, key_dir, coll, coll_rel, item = NULL) {
  p <- item$properties %||% list()
  bb <- bbox4(item$bbox %||% coll$extent$spatial$bbox[[1]])
  when <- p$datetime %||% p$start_datetime %||% coll$extent$temporal$interval[[1]][[1]]
  lapply(names(assets), function(k) {
    a <- assets[[k]]
    list(collection = coll$id, collection_title = or_na(coll$title), path = dir_of(coll_rel),
         item = or_na(item$id), asset = k, asset_title = or_na(a$title),
         roles = arr(a$roles), media_type = or_na(a$type), href = absolute(a$href, key_dir),
         proj_code = or_na(a$`proj:code` %||% p$`proj:code`),
         proj_bbox = arr(a$`proj:bbox` %||% p$`proj:bbox`, as.numeric),
         proj_shape = arr(a$`proj:shape` %||% p$`proj:shape`, as.numeric),
         row_count = or_na(a$`table:row_count`),
         column_names = if (is.null(a$`table:columns`)) NA else I(vapply(a$`table:columns`, function(c) c$name, "")),
         file_size = or_na(a$`file:size`), file_checksum = or_na(a$`file:checksum`),
         license = or_na(coll$license), keywords = arr(coll$keywords),
         datetime = or_na(when), updated = or_na(p$updated %||% coll$updated),
         collection_href = paste0(STAC_BASE, "/", coll_rel), description = or_na(coll$description),
         bbox = if (is.null(bb)) NA else I(bb))
  })
}

rows <- list(); n_coll <- 0L; n_item <- 0L
visit <- function(rel) {
  x <- read_stac(rel); dir <- dir_of(rel)
  if (identical(x$type, "Collection")) {
    n_coll <<- n_coll + 1L
    rows <<- c(rows, asset_rows(x$assets, dir, x, rel))
    for (l in Filter(function(l) l$rel == "item", x$links)) {
      irel <- resolve(l$href, dir); it <- read_stac(irel); n_item <<- n_item + 1L
      rows <<- c(rows, asset_rows(it$assets, dir_of(irel), x, rel, it))
    }
  }
  for (l in Filter(function(l) l$rel == "child", x$links)) visit(resolve(l$href, dir))
}
visit("catalog.json")

nd <- tempfile(fileext = ".ndjson")
writeLines(vapply(rows, function(r) toJSON(r, auto_unbox = TRUE, na = "null", null = "null", digits = NA), ""), nd)

con <- dbConnect(duckdb(shared_home = FALSE))
invisible(dbExecute(con, "INSTALL spatial; LOAD spatial; INSTALL json; LOAD json;"))
cols <- c(collection = "VARCHAR", collection_title = "VARCHAR", path = "VARCHAR", item = "VARCHAR", asset = "VARCHAR",
          asset_title = "VARCHAR", roles = "VARCHAR[]", media_type = "VARCHAR", href = "VARCHAR", proj_code = "VARCHAR",
          proj_bbox = "DOUBLE[]", proj_shape = "BIGINT[]", row_count = "BIGINT", column_names = "VARCHAR[]",
          file_size = "BIGINT", file_checksum = "VARCHAR", license = "VARCHAR", keywords = "VARCHAR[]",
          datetime = "VARCHAR", updated = "VARCHAR", collection_href = "VARCHAR", description = "VARCHAR", bbox = "DOUBLE[]")
spec <- paste0("{", paste(sprintf("'%s': '%s'", names(cols), cols), collapse = ", "), "}")
tmp <- paste0(INDEX, ".tmp")
ts <- function(x) sprintf("replace(rtrim(%s, 'Z'), 'T', ' ')::TIMESTAMP", x)   # RFC 3339 UTC -> TIMESTAMP (no ICU needed)
invisible(dbExecute(con, sprintf(
  "COPY (SELECT * EXCLUDE (bbox) REPLACE (%s AS datetime, %s AS updated),
                CASE WHEN bbox IS NULL THEN NULL ELSE ST_MakeEnvelope(bbox[1], bbox[2], bbox[3], bbox[4]) END AS geometry
          FROM read_ndjson('%s', columns = %s) ORDER BY path, item NULLS FIRST, asset)
   TO '%s' (FORMAT parquet, COMPRESSION zstd)", ts("datetime"), ts("updated"), nd, spec, tmp)))
invisible(file.rename(tmp, INDEX))
by_type <- dbGetQuery(con, sprintf("SELECT media_type, count(*) AS n FROM read_parquet('%s') GROUP BY 1 ORDER BY 2 DESC", INDEX))
dbDisconnect(con, shutdown = TRUE); unlink(nd)
message("wrote ", INDEX, ": ", length(rows), " assets of ", n_coll, " collections and ", n_item, " items; ",
        paste(sprintf("%s %d", by_type$media_type, by_type$n), collapse = ", "))
