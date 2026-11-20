# Macrocystis Pyrifera L C Agardh Stocks 1999

Macrocystis Pyrifera L C Agardh Stocks 1999: LIST product `MACROCYSTIS_PYRIFERA_L_C_AGARDH_STOCKS_1999`, statewide. 167 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-01-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Macrocystis Pyrifera L C Agardh Stocks 1999" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `macrocystis_pyrifera_l_c_agardh_stocks_1999_statewide.parquet` | vector | 167 | 48.2 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/macrocystis_pyrifera_l_c_agardh_stocks_1999/statewide/macrocystis_pyrifera_l_c_agardh_stocks_1999_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/macrocystis_pyrifera_l_c_agardh_stocks_1999/statewide/macrocystis_pyrifera_l_c_agardh_stocks_1999_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fmacrocystis_pyrifera_l_c_agardh_stocks_1999%2Fstatewide%2Fmacrocystis_pyrifera_l_c_agardh_stocks_1999_statewide.parquet

## Columns

`SPECIES` (string), `RELIABILIT` (string), `DENSITY` (string), `LOCATION` (string), `COMMENTS` (string), `ID` (double), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [MACROCYSTIS_PYRIFERA_L_C_AGARDH_STOCKS_1999_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/MACROCYSTIS_PYRIFERA_L_C_AGARDH_STOCKS_1999_STATEWIDE.zip), released 2021-01-14

## Attribution

"Macrocystis Pyrifera L C Agardh Stocks 1999" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
