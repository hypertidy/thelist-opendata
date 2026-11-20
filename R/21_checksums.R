#!/usr/bin/env Rscript
## 21_checksums.R
## manifest/checksums.csv: sha256 of every statewide file in the store, for the
## STAC catalogue (Portolan requires file:size and file:checksum on every asset).
##
## Keyed by path + size + last_modified from the store listing, so a re-run only
## hashes files that are new or changed. A file is hashed from DEST when a local
## copy of the same size is there (just converted), otherwise streamed from the
## public store.
##
##   Rscript R/21_checksums.R            # CORES=8 by default

suppressPackageStartupMessages({ library(duckdb); library(parallel) })

PUBLIC <- Sys.getenv("PUBLIC", "https://data.source.coop/mdsumner/thelist-opendata")
S3     <- "s3://us-west-2.opendata.source.coop/mdsumner/thelist-opendata"
DEST   <- Sys.getenv("DEST", "out")
CORES  <- as.integer(Sys.getenv("CORES", "8"))
OUTF   <- "manifest/checksums.csv"

con <- dbConnect(duckdb(shared_home = FALSE))
invisible(dbExecute(con, "INSTALL httpfs; LOAD httpfs; SET s3_region = 'us-west-2'; SET s3_url_style = 'path';"))
ls <- dbGetQuery(con, sprintf("SELECT filename, size, strftime(last_modified, '%%Y-%%m-%%dT%%H:%%M:%%SZ') AS last_modified
                               FROM read_blob('%s/*/*/statewide/*')", S3))
dbDisconnect(con, shutdown = TRUE)
ls <- ls[grepl("\\.(parquet|tif)$", ls$filename), ]
ls$path <- sub(paste0("^", S3, "/"), "", ls$filename)

old <- if (file.exists(OUTF)) read.csv(OUTF, colClasses = "character") else
  data.frame(path = character(), bytes = character(), last_modified = character(), sha256 = character())
key <- function(p, b, m) paste(p, b, m)
have <- setNames(old$sha256, key(old$path, old$bytes, old$last_modified))
todo <- ls[is.na(have[key(ls$path, format(ls$size, scientific = FALSE, trim = TRUE), ls$last_modified)]), ]
message(nrow(ls), " statewide files; ", nrow(todo), " to hash (", round(sum(todo$size) / 1e9, 1), " GB)")

hash_one <- function(i) {
  p <- todo$path[i]; loc <- file.path(DEST, p)
  cmd <- if (file.exists(loc) && file.size(loc) == todo$size[i]) sprintf("sha256sum %s", shQuote(loc))
         else sprintf("curl -sSfL --retry 5 %s | sha256sum", shQuote(paste0(PUBLIC, "/", p)))
  h <- sub(" .*", "", system(cmd, intern = TRUE))
  if (!grepl("^[0-9a-f]{64}$", h)) stop("hash failed: ", p)
  h
}
h <- unlist(mclapply(seq_len(nrow(todo)), function(i) tryCatch(hash_one(i), error = function(e) NA_character_), mc.cores = CORES))
if (anyNA(h)) message("failed: ", paste(todo$path[is.na(h)], collapse = ", "))

new <- data.frame(path = todo$path, bytes = format(todo$size, scientific = FALSE, trim = TRUE),
                  last_modified = todo$last_modified, sha256 = h)[!is.na(h), ]
cur <- data.frame(path = ls$path, bytes = format(ls$size, scientific = FALSE, trim = TRUE), last_modified = ls$last_modified)
cur$sha256 <- have[key(cur$path, cur$bytes, cur$last_modified)]
out <- rbind(cur[!is.na(cur$sha256), ], new)
out <- out[order(out$path), ]
write.csv(out, OUTF, row.names = FALSE)
message("wrote ", OUTF, ": ", nrow(out), " of ", nrow(ls), " files hashed")
