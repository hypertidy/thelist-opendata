.PHONY: all crawl parse peek convert statewide catalog checksums thumbnails pmtiles stac test
all: crawl parse peek
crawl:   ; Rscript R/00_crawl.R
parse:   ; Rscript R/01_parse.R
peek:    ; Rscript R/02_peek.R
convert: ; Rscript R/03_convert.R
statewide: ; Rscript R/04_statewide.R
catalog: ; Rscript R/20_catalog.R
checksums: ; Rscript R/21_checksums.R
thumbnails: ; Rscript R/23_thumbnails.R
pmtiles: ; Rscript R/24_pmtiles.R
stac: ; Rscript R/22_stac.R && portolan stac-geoparquet --catalog site/stac
test:    ; Rscript tests/test_parse.R
