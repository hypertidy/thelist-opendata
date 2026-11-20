# LIST EPA Regulated Sites

LIST EPA Regulated Sites: LIST product `LIST_EPA_REGULATED_SITES`, statewide. 700 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST EPA Regulated Sites" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `epa_premises_sites_public_list.parquet` | vector | 700 | 51.9 KB |
| `list_epa_regulated_sites_statewide.parquet` | vector | 700 | 51.8 KB |
| `epa_premises_docs_public_list.parquet` | table | 1,322 | 64.5 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_epa_regulated_sites/statewide/epa_premises_sites_public_list.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_epa_regulated_sites/statewide/epa_premises_sites_public_list.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_epa_regulated_sites%2Fstatewide%2Fepa_premises_sites_public_list.parquet

## Columns

`SITEID` (int32), `PREMISES_NAME` (string), `CLIENT_NAME` (string), `COMPANY_OR_BUSINESS_NO` (string), `EASTING` (string), `NORTHING` (string), `ACTIVITY_CATEGORY` (string)

## Source

- [LIST_EPA_REGULATED_SITES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_EPA_REGULATED_SITES_STATEWIDE.zip), released 2025-07-17

## Attribution

"LIST EPA Regulated Sites" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
