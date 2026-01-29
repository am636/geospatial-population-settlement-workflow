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
  data_raw/                # put the provided inputs here (not committed if sensitive)
  data_intermediate/       # derived rasters (e.g., SMOD_L1.tif, aligned SMOD on WorldPop grid)
  notebooks/               # numbered notebooks (run top-to-bottom)
  src/                     # optional helper scripts (if you break code out of notebooks)
  outputs/
    tables/                # CSV outputs used for answers
    figures/               # Python-generated figures
    qgis/                  # exported QGIS layouts (PNG/PDF) to embed in reports
  qa/                      # QA artefacts (metadata JSON, flagged features, closure residuals)
  docs/                    # optional notes
```

## Getting started

### 1) Create the environment (recommended: conda-forge)

```bash
conda env create -f environment.yml
conda activate copperbelt
```

If you prefer pip:

```bash
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 2) Add the input data

Copy the three provided files into `data_raw/`:

- `ZMB_adm2_gadm41_Copperbelt.shp` (+ sidecars)
- `zmb_ppp_2020_constrained.tif`
- `GHS_SMOD_E2020_GLOBE_R2023A_54009_1000_V1_0_R11_C21.tif`

> Tip: keep raw inputs untouched. Put anything you create into `data_intermediate/` or `outputs/`.

### 3) Run notebooks in order

1. `notebooks/00_sanity_check.ipynb`
2. `notebooks/01_boundary_QA.ipynb`
3. `notebooks/03_task3_total_population_by_adm2.ipynb`
4. `notebooks/04_recode_SMOD_L2_to_L1.ipynb`
5. `notebooks/05_dominant_smodL1_by_adm2_cellcounts.ipynb`
6. `notebooks/06_pop_by_smodL1_class_within_adm2_copperbelt.ipynb`

### 4) Presentation-style notebook

- `notebooks/02_presentation_report.ipynb` is a narrative “report/presentation” notebook.
- You can export it to HTML/PDF, or to slides (Reveal.js) using Jupyter nbconvert.

## Exporting a report / slides

HTML report:

```bash
jupyter nbconvert notebooks/02_presentation_report.ipynb --to html --output-dir docs
```

Slides (Reveal.js):

```bash
jupyter nbconvert notebooks/02_presentation_report.ipynb --to slides --reveal-prefix https://revealjs.com --output-dir docs
```

## QGIS figures

Export QGIS layouts to `outputs/qgis/` (e.g., `map_overview.png`). The presentation notebook includes a placeholder image link so the map appears in the rendered report automatically.

## Notes on harmonisation choices

- **SMOD is categorical** → always resample with **nearest neighbour**.
- For **population-by-class**, treat **WorldPop as the reference grid** and align SMOD to it (avoids resampling a counts surface).
- For **dominant class by area**, SMOD’s equal-area grid is appropriate; cell counts act as an area proxy.

## Licence / data
This repository contains analysis code and derived outputs only. The input datasets are from open sources (WorldPop, GHSL/GHS‑SMOD, GADM); check and comply with the upstream licences before redistribution.
