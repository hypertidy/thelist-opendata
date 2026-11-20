# Agents: Tasmanian Planning Scheme Code Overlay (`TASMANIAN_PLANNING_SCHEME_CODE_OVERLAY`)
General guidance for this catalogue: [AGENTS.md](../../AGENTS.md).
- Read in place; the data files are listed under `assets` in `collection.json`
- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.
- `table:columns` lists the columns and types; `table:row_count` = 1,563,426.
- Filter on the `geometry_bbox` column to read only the row groups you need.
- Native CRS: EPSG:28355. 
- Attribution required: "Tasmanian Planning Scheme Code Overlay" from theLIST (c) State of Tasmania (CC BY 3.0 AU).
