# LIST Nomenclature Csv

LIST Nomenclature Csv: LIST product `LIST_NOMENCLATURE_CSV`, statewide. 35,592 features, multi-point (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2022-05-18. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST Nomenclature Csv" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_nomenclature_csv_statewide.parquet` | vector | 35,592 | 4.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_nomenclature_csv/statewide/list_nomenclature_csv_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_nomenclature_csv/statewide/list_nomenclature_csv_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_nomenclature_csv%2Fstatewide%2Flist_nomenclature_csv_statewide.parquet

## Columns

`NOM_REG_NO` (string), `DATASET` (string), `FEAT_NAME` (string), `FEAT_ID` (int32), `FEAT_TYPE` (string), `FEAT_CLASS` (string), `FEAT_GROUP` (string), `STATUS_ID` (int32), `STATUS` (string), `DECN_NO` (double), `FORWD_REF` (string), `FORWD_NAME` (string), `GAZ_DATE` (datetime), `MEETING_NO` (double), `NOMFILE_RF` (string), `OFFIC_DATE` (datetime), `DUALNAME` (string), `OFFICIAL` (string), `STAGE_ID` (int32), `STAGE` (string), `FINAL_M_ID` (int32), `FINAL_MTHD` (string), `NAMETYPE` (string), `MUNY` (string), `MGA_EAST` (int32), `MGA_NORTH` (int32), `LATITUDE` (double), `LONGITUDE` (double), `LIST_GUID` (string), `DISP_STAT` (string), `CRC_ID` (string)

## Source

- [LIST_NOMENCLATURE_CSV_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_NOMENCLATURE_CSV_STATEWIDE.zip), released 2022-05-18

## Attribution

"LIST Nomenclature Csv" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
