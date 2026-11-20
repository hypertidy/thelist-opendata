# LIST Locality Postcode

LIST Locality Postcode: LIST product `LIST_LOCALITY_POSTCODE`, statewide. 777 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2025-07-17. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Locality Postcode" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_locality_postcode_statewide.parquet` | vector | 777 | 16.7 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_locality_postcode/statewide/list_locality_postcode_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_locality_postcode/statewide/list_locality_postcode_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_locality_postcode%2Fstatewide%2Flist_locality_postcode_statewide.parquet

## Columns

`LOCAL_ID` (int32), `NAME` (string), `POSTCODE` (int16), `PLAN_REF` (string), `GAZ_DATE` (datetime), `NOM_REG_NO` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [LIST_LOCALITY_POSTCODE_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_BREAK_O_DAY.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_BRIGHTON.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_BURNIE.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_CENTRAL_COAST.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_CENTRAL_HIGHLANDS.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_CIRCULAR_HEAD.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_CLARENCE.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_DERWENT_VALLEY.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_DEVONPORT.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_DORSET.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_FLINDERS.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_GEORGE_TOWN.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_GLAMORGAN_SPRING_BAY.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_GLENORCHY.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_HOBART.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_HUON_VALLEY.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_KENTISH.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_KING_ISLAND.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_KINGBOROUGH.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_LATROBE.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_LAUNCESTON.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_MEANDER_VALLEY.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_NORTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_SORELL.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_SOUTHERN_MIDLANDS.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_TASMAN.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_WARATAH_WYNYARD.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_WEST_COAST.zip), released 2025-07-17
- [LIST_LOCALITY_POSTCODE_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_LOCALITY_POSTCODE_WEST_TAMAR.zip), released 2025-07-17

## Attribution

"LIST Locality Postcode" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
