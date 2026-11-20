# LIST Acid Sulfate Soil Sites

LIST Acid Sulfate Soil Sites: LIST product `LIST_ACID_SULFATE_SOIL_SITES`, statewide. 266 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-07-04. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Acid Sulfate Soil Sites" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_acid_sulfate_soil_sites_statewide.parquet` | vector | 266 | 21.6 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_acid_sulfate_soil_sites/statewide/list_acid_sulfate_soil_sites_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_acid_sulfate_soil_sites/statewide/list_acid_sulfate_soil_sites_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_acid_sulfate_soil_sites%2Fstatewide%2Flist_acid_sulfate_soil_sites_statewide.parquet

## Columns

`SITE_ID` (string), `URLNAME` (string), `URL` (string), `EASTING` (double), `NORTHING` (double), `ASS_CLASSI` (string), `PROJECT_NA` (string), `SHAPE_FID` (int32), `LIST_GUID` (string)

## Source

- [LIST_ACID_SULFATE_SOIL_SITES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_ACID_SULFATE_SOIL_SITES_STATEWIDE.zip), released 2019-07-04

## Attribution

"LIST Acid Sulfate Soil Sites" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
