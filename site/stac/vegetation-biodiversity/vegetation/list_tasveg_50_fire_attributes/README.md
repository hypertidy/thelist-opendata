# LIST TASVEG 50 Fire Attributes

LIST TASVEG 50 Fire Attributes: LIST product `LIST_TASVEG_50_FIRE_ATTRIBUTES`, statewide. 482,138 features, multi-polygon (EPSG:28355). Converted from the LIST statewide zip (from the FileGDB where there is one): field names and types kept, geometries promoted to multi, native CRS kept. Source released 2025-11-25. Data (c) State of Tasmania, CC BY 3.0 AU: cite as "LIST TASVEG 50 Fire Attributes" from theLIST (c) State of Tasmania.

## Files

| file | kind | size | bytes |
|---|---|---|---|
| `list_tasveg_50_fire_attributes_statewide.parquet` | vector | 482,138 | 514.1 MB |

## Read it in place

```sql
INSTALL spatial; LOAD spatial;
SELECT * FROM read_parquet('https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_50_fire_attributes/statewide/list_tasveg_50_fire_attributes_statewide.parquet') LIMIT 10;
```

```sh
gdal vector info --summary /vsicurl/https://data.source.coop/mdsumner/thelist-opendata/geoparquet/list_tasveg_50_fire_attributes/statewide/list_tasveg_50_fire_attributes_statewide.parquet
```

More examples (R, Python, QGIS) and column types: https://hypertidy.github.io/thelist-opendata/#geoparquet%2Flist_tasveg_50_fire_attributes%2Fstatewide%2Flist_tasveg_50_fire_attributes_statewide.parquet

## Columns

`VEG_GROUP` (string), `VEGCODE` (string), `VEGCODE_D` (string), `SOURCE_DAT` (string), `FIREATT` (string), `FIRESENS` (string), `FLAMMAB` (string), `FRB_TREAT` (string), `TFI_LS` (double), `TFI_HS` (double), `TFI_MAX` (double), `SHAPE_Length` (double), `SHAPE_Area` (double)

## Source

- [LIST_TASVEG_50_FIRE_ATTRIBUTES_STATEWIDE.zip](https://listdata.thelist.tas.gov.au/opendata/data/LIST_TASVEG_50_FIRE_ATTRIBUTES_STATEWIDE.zip), released 2025-11-25

## Attribution

"LIST TASVEG 50 Fire Attributes" from theLIST (c) State of Tasmania, licensed CC BY 3.0 AU. Land Tasmania does not endorse this mirror.
