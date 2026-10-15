# The WFS route (tried 2021, dropped)
 
Folded in from mdsumner/thelist (archived), the first attempt at reading TheLIST
from R. It went through the public WFS rather than the bulk downloads:
 
    WFS:https://services.thelist.tas.gov.au/arcgis/services/Public/OpenDataWFS/MapServer/WFSServer
 
Layer names look like `Public_OpenDataWFS:LIST_Cadastral_Parcels`; the package
kept the list from `vapour::vapour_layer_names()` and matched loosely with
`agrep(x, list_layers, max.distance = 0.1, ignore.case = TRUE)`.
 
The idea was lazy queries with lazysf, e.g. address -> parcel id -> cadastral
parcel without downloading the layers:
 
```r
address <- lazysf::lazysf(dsn, thelist_layer("address"))   # agrep lookup as above
pid <- address |> dplyr::filter(ST_NO_FROM == 349, STREET == "ELIZABETH") |> dplyr::collect()
```
 
Verdict at the time: "a dead end, the WFS server stuff is bs by the looks" (slow,
and the ArcGIS WFS geometry needed casting). Hence the approach here: the
bulk-download listing as the source of truth, read over `/vsizip//vsicurl/`.
