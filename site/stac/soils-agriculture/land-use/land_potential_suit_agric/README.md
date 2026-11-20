# Land Potential Suit Agric

Land Potential Suit Agric: LIST product `LAND_POTENTIAL_SUIT_AGRIC`, statewide. 47,462 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-07-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Land Potential Suit Agric" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `land_potential_suit_agric_statewide.parquet` | vector | 47,462 | 25.3 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/land_potential_suit_agric/statewide/land_potential_suit_agric_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/land_potential_suit_agric/statewide/land_potential_suit_agric_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fland_potential_suit_agric%2Fstatewide%2Fland_potential_suit_agric_statewide.parquet

## Columns

`CID` (double), `VOLUME` (string), `FOLIO` (int32), `PID` (double), `POT_PID` (double), `LPI` (string), `CAD_TYPE1` (string), `CAD_TYPE2` (string), `TENURE_TY` (string), `COMP_AREA` (double), `MEAS_AREA` (double), `UFI` (string), `CREATED_ON` (string), `GIS_HA` (double), `CAP_VAL_HA` (int32), `CAP_VALUE` (int32), `EC1_HA` (double), `EC2_HA` (double), `EC3_HA` (double), `EC4_HA` (double), `EC5_HA` (double), `SUM_EC_HA` (double), `EC_PERCENT` (double), `EC_OVER50` (string), `CRITERIA1` (string), `CRITERIA2` (string), `CRITERIA3` (string), `RESULT` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LAND_POTENTIAL_SUIT_AGRIC_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LAND_POTENTIAL_SUIT_AGRIC_STATEWIDE.zip), released 2025-07-18

## Attribution

"Land Potential Suit Agric" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
