# Wedgetailed Eagle Nesting Habitat High

Wedgetailed Eagle Nesting Habitat High: LIST product `WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH`, statewide. 714,628 features, multi-polygon (EPSG:28355). Built from the 29 per-LGA LIST zips: features LIST clipped at LGA boundaries are rejoined to one row per `ID`, and an `lga` column names the source LGA(s); parts outside every LGA (over open water) are not in any LGA file. Source released 2021-03-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "Wedgetailed Eagle Nesting Habitat High" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `wedgetailed_eagle_nesting_habitat_high_statewide.parquet` | vector | 714,628 | 32.4 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/wedgetailed_eagle_nesting_habitat_high/statewide/wedgetailed_eagle_nesting_habitat_high_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/wedgetailed_eagle_nesting_habitat_high/statewide/wedgetailed_eagle_nesting_habitat_high_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Fwedgetailed_eagle_nesting_habitat_high%2Fstatewide%2Fwedgetailed_eagle_nesting_habitat_high_statewide.parquet

## Columns

`ID` (int32), `GRIDCODE` (int32), `SHAPE_Length` (double), `SHAPE_Area` (double), `lga` (string)

## Source

- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_BREAK_O_DAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_BREAK_O_DAY.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_BRIGHTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_BRIGHTON.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_BURNIE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_BURNIE.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CENTRAL_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CENTRAL_COAST.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CENTRAL_HIGHLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CENTRAL_HIGHLANDS.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CIRCULAR_HEAD.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CIRCULAR_HEAD.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CLARENCE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_CLARENCE.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_DERWENT_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_DERWENT_VALLEY.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_DEVONPORT.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_DEVONPORT.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_DORSET.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_DORSET.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_FLINDERS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_FLINDERS.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_GEORGE_TOWN.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_GEORGE_TOWN.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_GLAMORGAN_SPRING_BAY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_GLAMORGAN_SPRING_BAY.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_GLENORCHY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_GLENORCHY.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_HOBART.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_HOBART.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_HUON_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_HUON_VALLEY.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_KENTISH.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_KENTISH.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_KING_ISLAND.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_KING_ISLAND.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_KINGBOROUGH.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_KINGBOROUGH.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_LATROBE.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_LATROBE.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_LAUNCESTON.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_LAUNCESTON.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_MEANDER_VALLEY.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_MEANDER_VALLEY.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_NORTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_NORTHERN_MIDLANDS.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_SORELL.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_SORELL.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_SOUTHERN_MIDLANDS.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_SOUTHERN_MIDLANDS.zip), released 2021-03-18
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_TASMAN.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_TASMAN.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_WARATAH_WYNYARD.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_WARATAH_WYNYARD.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_WEST_COAST.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_WEST_COAST.zip), released 2021-03-17
- [WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_WEST_TAMAR.zip](https://listdata.thelist.tas.gov.au/opendata/data/WEDGETAILED_EAGLE_NESTING_HABITAT_HIGH_WEST_TAMAR.zip), released 2021-03-18

## Attribution

"Wedgetailed Eagle Nesting Habitat High" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
