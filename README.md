# Copperbelt (Zambia) — Population distribution by settlement type

This repository contains a small, reproducible workflow for analysing the spatial distribution of population in **Copperbelt Province, Zambia** using:

- **WorldPop 2020 constrained population** (GeoTIFF, EPSG:4326; people-per-cell)
- **GHS‑SMOD 2020 settlement model** (GeoTIFF, Mollweide ESRI:54009; categorical L2 codes reclassified to L1)
- **GADM v4.1 ADM2 boundaries** for Copperbelt (Shapefile, EPSG:4326)

## What you can reproduce

- **Task 1**: metadata sanity checks (CRS, resolution, NoData, bounds)
- **Task 2**: quick **boundary QA** (exact duplicates; out-of-scope feature)
- **Task 3**: total population per ADM2 (WorldPop zonal sum)
- **Task 4**: SMOD **L2 → L1** recode (Int16 categorical with explicit NoData)
- **Task 5**: dominant SMOD L1 class per ADM2 by **area proxy** (cell counts on equal-area grid)
- **Task 6**: population by SMOD L1 class within each ADM2 (SMOD aligned to the WorldPop grid; closure checks)

## Repository layout

```
copperbelt_worldpop_smod/
  data_raw/              ]
  notebooks/               
  outputs/
    tables/                
    figures/             
    qgis/                 

```

