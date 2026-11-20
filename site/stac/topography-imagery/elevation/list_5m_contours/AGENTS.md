# Agents: LIST 5 m Contours (`LIST_5M_CONTOURS`)
General guidance for this catalogue: [AGENTS.md](../../../AGENTS.md).
- Read in place; the data files are listed under `assets` in `collection.json`
- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.
- `table:columns` lists the columns and types; `table:row_count` = 70,668.
- Filter on the `geometry_bbox` column to read only the row groups you need.
- Native CRS: EPSG:28355. 
- Built from the per-LGA LIST zips; the `lga` column names the source LGA(s). See the collection description.
- Attribution required: "LIST 5 m Contours" from theLIST (c) State of Tasmania (CC BY 3.0 AU).
