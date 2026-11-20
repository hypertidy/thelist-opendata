# Agents: LIST Tasnetworks Low Voltage Conductors (`LIST_TASNETWORKS_LOW_VOLTAGE_CONDUCTORS`)
General guidance for this catalogue: [AGENTS.md](../../../AGENTS.md).
- Read in place; the data files are listed under `assets` in `collection.json`
- Each asset gives `file:size`, `file:checksum` (sha2-256 multihash) and, where spatial, `proj:code` and `proj:bbox`.
- `table:columns` lists the columns and types; `table:row_count` = 360,513.
- Filter on the `geometry_bbox` column to read only the row groups you need.
- Native CRS: EPSG:28355. 
- Attribution required: "LIST Tasnetworks Low Voltage Conductors" from theLIST (c) State of Tasmania (CC BY 3.0 AU).
