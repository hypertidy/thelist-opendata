.PHONY: all crawl parse peek convert test
all: crawl parse peek
crawl:   ; Rscript R/00_crawl.R
parse:   ; Rscript R/01_parse.R
peek:    ; Rscript R/02_peek.R
convert: ; Rscript R/03_convert.R
test:    ; Rscript tests/test_parse.R
