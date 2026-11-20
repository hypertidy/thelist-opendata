# Heritage Tasmania HMS Features

Heritage Tasmania HMS Features: LIST product `HERITAGE_TASMANIA_HMS_FEATURES`, statewide. 5,533 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Heritage Tasmania HMS Features" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `heritage_tasmania_hms_features_statewide.parquet` | vector | 5,533 | 2.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/heritage_tasmania_hms_features/statewide/heritage_tasmania_hms_features_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/heritage_tasmania_hms_features/statewide/heritage_tasmania_hms_features_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fheritage_tasmania_hms_features%2Fstatewide%2Fheritage_tasmania_hms_features_statewide.parquet

## Columns

`THR_ID` (string), `THR_NAME` (string), `CPR_REF` (string), `TITLE_REF` (string), `MUNICIPALITY` (string), `REG_STATUS` (string), `LOC_ADD` (string), `SUM_ADD` (string), `BDY_REF` (string), `LIST_GUID` (string), `CRC_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [HERITAGE_TASMANIA_HMS_FEATURES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/HERITAGE_TASMANIA_HMS_FEATURES_STATEWIDE.zip), released 2025-07-18

## Attribution

"Heritage Tasmania HMS Features" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
