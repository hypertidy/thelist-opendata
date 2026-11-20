# LIST Marine Acid Sulfate Soils

LIST Marine Acid Sulfate Soils: LIST product `LIST_MARINE_ACID_SULFATE_SOILS`, statewide. 4,218 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-01-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Marine Acid Sulfate Soils" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_marine_acid_sulfate_soils_statewide.parquet` | vector | 4,218 | 8.8 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_acid_sulfate_soils/statewide/list_marine_acid_sulfate_soils_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_marine_acid_sulfate_soils/statewide/list_marine_acid_sulfate_soils_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_marine_acid_sulfate_soils%2Fstatewide%2Flist_marine_acid_sulfate_soils_statewide.parquet

## Columns

`ID` (int32), `DATASET_NA` (string), `ASS_PROBAB` (string), `ASS_ATLAS_` (string), `ASS_ATLAS1` (string), `DEPTHRANGE` (string), `DEPTHRAN_1` (string), `SUBSTRATET` (string), `SUBSTRATEI` (string), `OCEANOGRAP` (string), `WATERBODYT` (string), `WATERBODYN` (string), `SHELTEREDA` (string), `SHELTERE_1` (string), `POSITIONAL` (string), `HECTARES` (double), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_MARINE_ACID_SULFATE_SOILS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_MARINE_ACID_SULFATE_SOILS_STATEWIDE.zip), released 2019-01-18

## Attribution

"LIST Marine Acid Sulfate Soils" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
