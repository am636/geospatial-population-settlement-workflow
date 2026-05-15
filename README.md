# Geospatial population and settlement workflow

This repository contains a reproducible Python workflow for integrating gridded population data, categorical settlement or land-cover rasters, and administrative boundary layers.

The workflow focuses on practical geospatial data processing: checking input quality, harmonising raster and vector datasets, producing boundary-based summaries, and exporting analysis-ready tables and visual outputs.

## Workflow summary

The workflow covers seven common stages in raster-vector spatial analysis:

1. **Input metadata checks**
   - Inspect coordinate reference systems, raster resolution, bounds, dimensions, data types, and NoData values.
   - Confirm whether layers can be compared directly or require reprojection, clipping, or grid alignment.

2. **Boundary quality assurance**
   - Check administrative or reporting boundaries for geometry validity, duplicate records, and out-of-domain features.
   - Produce simple QA outputs before running spatial summaries.

3. **Population summaries by boundary**
   - Calculate zonal population totals for each reporting unit.
   - Export clean tabular outputs for reporting, mapping, or downstream analysis.

4. **Categorical raster reclassification**
   - Recode detailed settlement, land-cover, or urban-rural classes into broader analytical categories.
   - Preserve categorical data types and explicit NoData handling.

5. **Raster alignment**
   - Align categorical and continuous raster layers to a common grid.
   - Use nearest-neighbour resampling for categorical classes to avoid creating invalid intermediate categories.

6. **Population by class**
   - Combine population and categorical raster layers to estimate population totals and proportions by class within each boundary.
   - Run consistency checks to compare class totals against overall population totals.

7. **Outputs and documentation**
   - Save reproducible tables, figures, GIS-ready outputs, and QA artefacts.
   - Keep raw inputs, intermediate files, and final outputs organised separately.

## Example input data types

The same structure can be adapted to different study areas and datasets, including:

- gridded population rasters;
- categorical settlement, land-cover, or urban-rural classification rasters;
- administrative boundaries or custom reporting zones;
- optional basemaps or reference layers for visualisation and QA.

Raw geospatial datasets are often large and may have redistribution restrictions, so they should normally be downloaded separately from the original providers rather than stored directly in the repository.

## Repository layout

```text
.
├── notebooks/          # Reproducible analysis notebooks
├── outputs/
│   ├── tables/         # CSV summaries and QA tables
│   ├── figures/        # Maps and charts
│   └── qgis/           # GIS-ready outputs
├── data_raw/           # Local input data; normally not versioned if large
└── README.md
```

## Python requirements

Core packages:

- `geopandas`
- `rasterio`
- `pandas`
- `numpy`
- `matplotlib`

A Conda or Mamba environment is recommended for installing geospatial dependencies, especially GDAL-related packages used by `rasterio` and `geopandas`.

## Reproducibility notes

For a new analysis, update the input paths, boundary layer, raster sources, classification legend, and output names to match the chosen study area and datasets.

The workflow is designed to make spatial assumptions explicit: CRS handling, grid alignment, resampling method, NoData treatment, and closure checks are documented as part of the analysis rather than hidden in ad hoc processing steps.

## Methods covered

- Raster-vector integration
- CRS, grid, and metadata quality assurance
- Zonal statistics
- Categorical raster reclassification
- Population and settlement-class summaries
- Reproducible Python geospatial processing
- Spatial reporting and visualisation
