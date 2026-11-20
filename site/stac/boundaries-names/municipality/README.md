# LGA boundaries (municipalities)

LGA boundaries (municipalities): LIST product `MUNICIPALITY`, statewide. 29 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `LIST_GUID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2021-01-13. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LGA boundaries (municipalities)" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `municipality_statewide.parquet` | vector | 29 | 14.9 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/municipality/statewide/municipality_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/municipality/statewide/municipality_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fmunicipality%2Fstatewide%2Fmunicipality_statewide.parquet

## Columns

`LGA_ID` (int32), `NAME` (string), `LGA_CODE` (int16), `PLAN_REF` (string), `GAZ_DATE` (datetime), `NOM_REG_NO` (string), `UFI` (string), `CREATED_ON` (string), `LIST_GUID` (string), `Shape_Length` (double), `Shape_Area` (double), `lga` (string)

## Source

- [LIST_DEM_25M_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_BREAK_O_DAY.zip), released 2021-01-13
- [LIST_DEM_25M_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_BRIGHTON.zip), released 2021-01-13
- [LIST_DEM_25M_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_BURNIE.zip), released 2021-01-13
- [LIST_DEM_25M_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CENTRAL_COAST.zip), released 2021-01-13
- [LIST_DEM_25M_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CENTRAL_HIGHLANDS.zip), released 2021-01-13
- [LIST_DEM_25M_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CIRCULAR_HEAD.zip), released 2021-01-13
- [LIST_DEM_25M_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_CLARENCE.zip), released 2021-01-13
- [LIST_DEM_25M_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_DERWENT_VALLEY.zip), released 2021-01-13
- [LIST_DEM_25M_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_DEVONPORT.zip), released 2021-01-13
- [LIST_DEM_25M_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_DORSET.zip), released 2021-01-13
- [LIST_DEM_25M_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_FLINDERS.zip), released 2021-01-13
- [LIST_DEM_25M_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_GEORGE_TOWN.zip), released 2021-01-13
- [LIST_DEM_25M_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_GLAMORGAN_SPRING_BAY.zip), released 2021-01-13
- [LIST_DEM_25M_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_GLENORCHY.zip), released 2021-01-13
- [LIST_DEM_25M_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_HOBART.zip), released 2021-01-13
- [LIST_DEM_25M_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_HUON_VALLEY.zip), released 2021-01-13
- [LIST_DEM_25M_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_KENTISH.zip), released 2021-01-13
- [LIST_DEM_25M_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_KING_ISLAND.zip), released 2021-01-13
- [LIST_DEM_25M_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_KINGBOROUGH.zip), released 2021-01-13
- [LIST_DEM_25M_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_LATROBE.zip), released 2021-01-13
- [LIST_DEM_25M_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_LAUNCESTON.zip), released 2021-01-13
- [LIST_DEM_25M_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_MEANDER_VALLEY.zip), released 2021-01-13
- [LIST_DEM_25M_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_NORTHERN_MIDLANDS.zip), released 2021-01-13
- [LIST_DEM_25M_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_SORELL.zip), released 2021-01-13
- [LIST_DEM_25M_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_SOUTHERN_MIDLANDS.zip), released 2021-01-13
- [LIST_DEM_25M_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_TASMAN.zip), released 2021-01-13
- [LIST_DEM_25M_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_WARATAH_WYNYARD.zip), released 2021-01-13
- [LIST_DEM_25M_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_WEST_COAST.zip), released 2021-01-13
- [LIST_DEM_25M_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_DEM_25M_WEST_TAMAR.zip), released 2021-01-13

## Attribution

"LGA boundaries (municipalities)" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
