# Harvest Tonnages Macrocystis Pyrifera 1970 1971

Harvest Tonnages Macrocystis Pyrifera 1970 1971: LIST product `HARVEST_TONNAGES_MACROCYSTIS_PYRIFERA_1970_1971`, statewide. 58 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2021-01-14. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Harvest Tonnages Macrocystis Pyrifera 1970 1971" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `harvest_tonnages_macrocystis_pyrifera_1970_1971_statewide.parquet` | vector | 58 | 14.1 KB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/harvest_tonnages_macrocystis_pyrifera_1970_1971/statewide/harvest_tonnages_macrocystis_pyrifera_1970_1971_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/harvest_tonnages_macrocystis_pyrifera_1970_1971/statewide/harvest_tonnages_macrocystis_pyrifera_1970_1971_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fharvest_tonnages_macrocystis_pyrifera_1970_1971%2Fstatewide%2Fharvest_tonnages_macrocystis_pyrifera_1970_1971_statewide.parquet

## Columns

`NAME` (string), `TONS` (double), `XCOORD` (double), `YCOORD` (double), `SHAPE_FID` (int32), `LIST_GUID` (string)

## Source

- [HARVEST_TONNAGES_MACROCYSTIS_PYRIFERA_1970_1971_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/HARVEST_TONNAGES_MACROCYSTIS_PYRIFERA_1970_1971_STATEWIDE.zip), released 2021-01-14

## Attribution

"Harvest Tonnages Macrocystis Pyrifera 1970 1971" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
