# Population and settlement patterns in Copperbelt, Zambia

This repository contains a small Python GIS case study combining population, settlement-class and administrative-boundary data for Copperbelt Province, Zambia.

The purpose is practical: check and harmonise spatial inputs, summarise gridded population by district, compare population across settlement classes, and export simple QA tables and GIS-ready outputs.

## Data included

The repository currently contains:

- `ZMB_adm2_gadm41_Copperbelt.shp` and associated shapefile components — district boundaries for Copperbelt;
- `zmb_ppp_2020_constrained.tif` — gridded population data;
- `GHS_SMOD_E2020_GLOBE_R2023A_54009_1000_V1_0_R11_C21.tif` — categorical settlement raster.

The notebooks use these filenames directly so the example can be run without renaming the supplied files.

## Workflow

The notebooks are intended to be run in order:

1. `01_metadata_checks.ipynb` — inspect CRS, raster resolution, bounds, NoData values and geometry types;
2. `02_boundary_quality_assurance.ipynb` — check geometry validity, duplicates and district-area diagnostics;
3. `03_population_zonal_summary.ipynb` — calculate gridded population totals by district;
4. `04_categorical_raster_reclassification.ipynb` — prepare the settlement raster. By default the original class codes are retained; a custom mapping can be supplied if broader classes are required;
5. `05_dominant_class_by_boundary.ipynb` — summarise settlement-class composition by district;
6. `06_population_by_class.ipynb` — combine the population and settlement rasters and check that class totals close against district population totals.

Tables and run summaries are written under `outputs/`.

## Python environment

Core packages:

- `geopandas`
- `rasterio`
- `pandas`
- `numpy`
- `matplotlib`

The supplied `environment.yml` or `requirements.txt` can be used to create the environment.

## Notes

This is a compact spatial-analysis case study rather than a demographic model. Results depend on the definitions, resolution and provenance of the input products. Raster alignment, NoData handling and boundary assumptions are kept explicit in the notebooks so they can be checked before interpretation.

**Author:** Ali Moayedi  
University of St Andrews
