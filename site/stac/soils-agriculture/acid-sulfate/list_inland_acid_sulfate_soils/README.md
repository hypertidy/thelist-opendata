# LIST Inland Acid Sulfate Soils

LIST Inland Acid Sulfate Soils: LIST product `LIST_INLAND_ACID_SULFATE_SOILS`, statewide. 14,291 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2019-01-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Inland Acid Sulfate Soils" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_inland_acid_sulfate_soils_statewide.parquet` | vector | 14,291 | 19.6 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_inland_acid_sulfate_soils/statewide/list_inland_acid_sulfate_soils_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_inland_acid_sulfate_soils/statewide/list_inland_acid_sulfate_soils_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_inland_acid_sulfate_soils%2Fstatewide%2Flist_inland_acid_sulfate_soils_statewide.parquet

## Columns

`ID` (int32), `DATASET_NA` (string), `ASS_PROBAB` (string), `ASS_ATLAS_` (string), `ASS_ATLAS1` (string), `TOTAL_WEIG` (double), `GEOLOGY_DA` (string), `GEOLOGY_SY` (string), `GEOLOGY_DE` (string), `GEOLOGY_WE` (double), `SOIL_DATAS` (string), `SOIL_DAT_1` (string), `SOIL_DESCR` (string), `SOIL_ASCTY` (string), `SOIL_WEIGH` (double), `MRVBF_DATA` (string), `MRVBF_VALU` (string), `MRVBF_WEIG` (double), `SWAMP_DATA` (string), `SWAMP_NAME` (string), `SWAMP_WEIG` (double), `WETAREA_DA` (string), `WETAREA_NA` (string), `WETAREA_WE` (double), `SALTPAN_DA` (string), `SALTPAN_NA` (string), `SALTPAN_WE` (double), `FLOODPLAIN` (string), `FLOODPLA_1` (double), `TASVEG_DAT` (string), `TASVEG_DES` (string), `TASVEG_WEI` (double), `WATERBODY_` (string), `WATERBODY1` (string), `WATERBOD_1` (double), `POSITIONAL` (string), `HECTARES` (double), `SHAPE_FID` (int32), `LIST_GUID` (string), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_INLAND_ACID_SULFATE_SOILS_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_INLAND_ACID_SULFATE_SOILS_STATEWIDE.zip), released 2019-01-18

## Attribution

"LIST Inland Acid Sulfate Soils" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
