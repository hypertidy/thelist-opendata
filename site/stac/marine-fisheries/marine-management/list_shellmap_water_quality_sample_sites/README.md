# LIST Shellmap Water Quality Sample Sites

LIST Shellmap Water Quality Sample Sites: LIST product `LIST_SHELLMAP_WATER_QUALITY_SAMPLE_SITES`, statewide. 257 features, multi-point (OGC:CRS84). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Shellmap Water Quality Sample Sites" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_shellmap_water_quality_sample_sites_statewide.parquet` | vector | 257 | 21.8 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_shellmap_water_quality_sample_sites/statewide/list_shellmap_water_quality_sample_sites_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_shellmap_water_quality_sample_sites/statewide/list_shellmap_water_quality_sample_sites_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_shellmap_water_quality_sample_sites%2Fstatewide%2Flist_shellmap_water_quality_sample_sites_statewide.parquet

## Columns

`SITE_ID` (string), `OLD_SITECODE` (string), `GROWINGAREA` (string), `HARVESTAREA` (string), `SITE_STATUS` (string), `APPLICATION` (string), `LATITUDE` (double), `LONGITUDE` (double)

## Source

- [LIST_SHELLMAP_WATER_QUALITY_SAMPLE_SITES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_SHELLMAP_WATER_QUALITY_SAMPLE_SITES_STATEWIDE.zip), released 2025-07-18

## Attribution

"LIST Shellmap Water Quality Sample Sites" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
