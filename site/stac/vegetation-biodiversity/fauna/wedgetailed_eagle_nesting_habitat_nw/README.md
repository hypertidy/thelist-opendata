# Wedgetailed Eagle Nesting Habitat NW

Wedgetailed Eagle Nesting Habitat NW: LIST product `WEDGETAILED_EAGLE_NESTING_HABITAT_NW`, statewide. 77,701 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-03-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Wedgetailed Eagle Nesting Habitat NW" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `wedgetailed_eagle_nesting_habitat_nw_statewide.parquet` | vector | 77,701 | 5.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/wedgetailed_eagle_nesting_habitat_nw/statewide/wedgetailed_eagle_nesting_habitat_nw_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/wedgetailed_eagle_nesting_habitat_nw/statewide/wedgetailed_eagle_nesting_habitat_nw_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fwedgetailed_eagle_nesting_habitat_nw%2Fstatewide%2Fwedgetailed_eagle_nesting_habitat_nw_statewide.parquet

## Columns

`ID` (int32), `GRIDCODE` (int32), `ES_DATA_PWS_EAGLE_NW_HAB_AREA` (int32), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [WEDGETAILED_EAGLE_NESTING_HABITAT_NW_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_NW_STATEWIDE.zip), released 2021-03-18

## Attribution

"Wedgetailed Eagle Nesting Habitat NW" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
