.PHONY: all crawl parse peek convert statewide catalog test
all: crawl parse peek
crawl:   ; Rscript R/00_crawl.R
parse:   ; Rscript R/01_parse.R
peek:    ; Rscript R/02_peek.R
convert: ; Rscript R/03_convert.R
statewide: ; Rscript R/04_statewide.R
catalog: ; Rscript R/20_catalog.R
test:    ; Rscript tests/test_parse.R
