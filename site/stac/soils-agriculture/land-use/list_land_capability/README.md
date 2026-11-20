# LIST Land Capability

LIST Land Capability: LIST product `LIST_LAND CAPABILITY`, statewide. 13,004 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Land Capability" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_land_capability_statewide.parquet` | vector | 13,004 | 17.8 MB |
| `agency_staging.parquet` | table | 13,004 | 657.7 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_capability/statewide/list_land_capability_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_land_capability/statewide/list_land_capability_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_land_capability%2Fstatewide%2Flist_land_capability_statewide.parquet

## Columns

`LANDCAP_ID` (int64), `CLASS` (string), `SOURCE` (string), `DESCRIPTIO` (string), `PARKS_LAND` (decimal), `PERIMETER` (decimal), `SHAPE_FID` (int64), `LIST_GUID` (string), `SHAPE_AREA` (decimal), `SHAPE_LEN` (decimal)

## Source

- [LIST_LAND%20CAPABILITY_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LAND%20CAPABILITY_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST Land Capability" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
