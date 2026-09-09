#!/usr/bin/env Rscript
## 01_parse.R
## manifest/index.csv -> manifest/files.csv
## Adds: ext, product, region, region_type (statewide | lga | none), variant
## Filenames are PRODUCT_REGION.zip; REGION is STATEWIDE or an LGA name
## tokenised uppercase with underscores. Match the longest LGA suffix first so
## WEST_COAST beats COAST etc.

idx <- read.csv("manifest/index.csv", stringsAsFactors = FALSE)

## the 29 Tasmanian LGAs as they appear in filenames
LGA <- c("BREAK_O_DAY", "BRIGHTON", "BURNIE", "CENTRAL_COAST", "CENTRAL_HIGHLANDS",
         "CIRCULAR_HEAD", "CLARENCE", "DERWENT_VALLEY", "DEVONPORT", "DORSET",
         "FLINDERS", "GEORGE_TOWN", "GLAMORGAN_SPRING_BAY", "GLENORCHY", "HOBART",
         "HUON_VALLEY", "KENTISH", "KING_ISLAND", "KINGBOROUGH", "LATROBE",
         "LAUNCESTON", "MEANDER_VALLEY", "NORTHERN_MIDLANDS", "SORELL",
         "SOUTHERN_MIDLANDS", "TASMAN", "WARATAH_WYNYARD", "WEST_COAST", "WEST_TAMAR")
REGIONS <- c("STATEWIDE", LGA[order(-nchar(LGA))])

stem <- toupper(sub("/$", "", idx$name))
## known trailing variants that sit after the region, e.g. CHM_2M_STATEWIDE_OLD.zip
variant <- ifelse(grepl("_OLD\\.[A-Z0-9]+$|_OLD$", stem), "OLD", "")
stem <- sub("_OLD(\\.[A-Z0-9]+)?$", "\\1", stem)
ext <- ifelse(idx$is_dir, "dir", tolower(sub("^.*?\\.((shp|tab|gdb)\\.xml|[A-Za-z0-9]+)$", "\\1", idx$name)))
ext[!grepl("\\.", idx$name) & !idx$is_dir] <- ""
base <- sub("\\.[A-Z0-9.]+$", "", stem)
base <- sub("\\.GDB$", "", base)

region <- rep(NA_character_, length(base))
for (r in REGIONS) {
  hit <- is.na(region) & grepl(paste0("_", r, "$"), base)
  region[hit] <- r
}
product <- ifelse(is.na(region), base, sub(paste0("_(", paste(REGIONS, collapse = "|"), ")$"), "", base))
region_type <- ifelse(is.na(region), "none", ifelse(region == "STATEWIDE", "statewide", "lga"))

out <- cbind(idx[, c("url", "path", "name", "is_dir", "bytes", "mtime", "etag")],
             ext = ext, product = product, region = ifelse(is.na(region), "", region),
             region_type = region_type, variant = variant, stringsAsFactors = FALSE)
out <- out[order(out$product, out$region_type, out$region, out$name), ]
write.csv(out, "manifest/files.csv", row.names = FALSE, na = "")

## a per-product roll-up: how many regions, total bytes, is it split by LGA
z <- out[!out$is_dir & out$ext == "zip" & out$variant == "", ]
prod <- aggregate(cbind(n = 1, bytes = z$bytes) ~ product, data = z, FUN = sum)
prod$regions <- sapply(prod$product, function(p) paste(sort(z$region[z$product == p]), collapse = ";"))
prod$split <- ifelse(grepl("STATEWIDE", prod$regions), ifelse(prod$n > 1, "both", "statewide"), "lga")
prod <- prod[order(-prod$bytes), c("product", "split", "n", "bytes", "regions")]
write.csv(prod, "manifest/products.csv", row.names = FALSE, na = "")

message("files.csv: ", nrow(out), " rows; products.csv: ", nrow(prod), " products (",
        sum(prod$split != "statewide"), " split by LGA); unparsed regions on ",
        sum(out$region_type == "none" & out$ext == "zip"), " zips")
print(out[out$region_type == "none" & !out$is_dir, c("name", "ext")])
