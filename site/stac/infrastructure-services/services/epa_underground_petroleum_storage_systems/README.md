# EPA Underground Petroleum Storage Systems

EPA Underground Petroleum Storage Systems: LIST product `EPA_UNDERGROUND_PETROLEUM_STORAGE_SYSTEMS`, statewide. 12 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2020-04-09. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "EPA Underground Petroleum Storage Systems" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `epa_underground_petroleum_storage_systems_statewide.parquet` | vector | 12 | 287.3 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_underground_petroleum_storage_systems/statewide/epa_underground_petroleum_storage_systems_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/epa_underground_petroleum_storage_systems/statewide/epa_underground_petroleum_storage_systems_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fepa_underground_petroleum_storage_systems%2Fstatewide%2Fepa_underground_petroleum_storage_systems_statewide.parquet

## Columns

`NETWORK` (string), `MATERIAL` (string), `DESCRIPTION` (string), `CORRIDOR_W` (string), `CORRIDOR_WIDTH_EACHSIDE` (string), `FEATURE_ID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [EPA_UNDERGROUND_PETROLEUM_STORAGE_SYSTEMS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/EPA_UNDERGROUND_PETROLEUM_STORAGE_SYSTEMS_STATEWIDE.zip), released 2020-04-09

## Attribution

"EPA Underground Petroleum Storage Systems" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
