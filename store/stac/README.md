# Tasmania LIST open data, cloud-ready: STAC catalogue

A [STAC](https://stacspec.org) 1.1 catalogue, conforming to the
[Portolan](https://cloudnativegeo.org/blog/2026/09/introducing-portolan/) profile,
of every statewide dataset in the LIST open data mirror on Source Cooperative
(https://source.coop/mdsumner/thelist-opendata).

    catalog.json                          this catalogue
    collections.parquet                   every asset of every collection and item, one row each
    <theme>/catalog.json                  14 themes (hazards-climate, property-cadastre, water, ...)
    <theme>[/<sub>]/<product>/collection.json
                                          one collection per LIST product; its statewide
                                          file(s) are the collection's assets, or one item
                                          per COG where a product has several

It lives in the store at
https://data.source.coop/mdsumner/thelist-opendata/stac/catalog.json, with a copy
at https://hypertidy.github.io/thelist-opendata/stac/catalog.json.

Asset hrefs are absolute HTTPS URLs into the store, so every file can be read in
place (HTTP range requests, CORS open). Each asset carries its size, sha2-256
checksum, CRS, and for tables the row count and columns. Layers too big to draw
directly have PMTiles (a `visual` asset) and a map style (`style`).

`collections.parquet` (GeoParquet, the geometry is each row's lon/lat bbox) is
the whole catalogue in one read: collection, item, asset key, roles, media
type, absolute href, CRS, row count, column names, size, checksum, licence,
keywords, dates and description. For example, with DuckDB:

```sql
INSTALL spatial; LOAD spatial; INSTALL httpfs; LOAD httpfs;
SELECT collection, media_type, href, row_count
FROM 'https://data.source.coop/mdsumner/thelist-opendata/stac/collections.parquet'
WHERE list_contains(roles, 'data') AND collection LIKE '%parcel%';
```

- Browse it on a map: https://browser.portolan-sdi.org/#/external/hypertidy.github.io/thelist-opendata/stac/catalog.json
- Listing with copy-ready examples for DuckDB, GDAL, R, Python and QGIS:
  https://hypertidy.github.io/thelist-opendata/

Where LIST ships a product only as 29 per-LGA zips, the statewide file is built
from them: features LIST clipped at LGA boundaries are rejoined to one row per
feature id, with an `lga` column naming the source LGAs. Each collection's
description says which applies.

Data (c) State of Tasmania, licensed CC BY 3.0 AU. Cite each dataset as
"<dataset name>" from theLIST (c) State of Tasmania. Land Tasmania does not
endorse this mirror. Built by https://github.com/hypertidy/thelist-opendata
(`R/22_stac.R`).
