# Reproducible raster-vector geospatial workflow

This repository presents a compact, reproducible Python workflow for integrating population rasters, settlement-class rasters, and administrative boundary data. It is designed as a general geospatial data-processing example rather than a location-specific analysis.

The workflow demonstrates how to:

- inspect raster and vector metadata before analysis;
- check coordinate reference systems, resolution, bounds, NoData values, and grid alignment;
- identify common boundary-data issues such as duplicate geometries and out-of-scope features;
- calculate zonal summaries from gridded population data;
- reclassify categorical settlement rasters into broader analytical classes;
- align categorical and continuous raster layers safely using appropriate resampling rules;
- summarise population by settlement class within administrative units;
- export QA tables, analysis-ready CSV outputs, figures, and GIS-ready layers.

## Why this repository is useful

Many spatial analysis tasks require combining datasets that were produced on different grids, coordinate systems, and classification schemes. This repository shows a transparent way to handle those problems while keeping quality assurance visible at each stage.

The emphasis is on transferable geospatial practice:

- **Raster-vector integration** for administrative and environmental summaries.
- **CRS and grid QA** before overlay or extraction.
- **Zonal statistics** for boundary-based summaries.
- **Categorical raster handling** using nearest-neighbour alignment rather than continuous interpolation.
- **Reproducible outputs** including tables, figures, QA artefacts, and GIS-ready files.

## Example input data types

The workflow can be adapted to any comparable study area using equivalent open geospatial datasets, for example:

- a gridded population raster;
- a categorical settlement, land-cover, or urban/rural classification raster;
- administrative or reporting boundaries;
- optional reference layers for mapping and QA.

Large raw datasets are not required to understand the workflow structure and should normally be downloaded separately from their original providers rather than stored directly in the repository.

## Workflow overview

1. **Metadata and input checks**
   - Inspect CRS, resolution, bounds, dimensions, NoData values, and data types.
   - Confirm whether spatial layers are compatible or require reprojection/alignment.

2. **Boundary quality assurance**
   - Check geometry validity and duplicated features.
   - Identify boundary records that fall outside the intended analysis domain.

3. **Population summaries by boundary**
   - Use zonal operations to estimate total population per administrative unit.
   - Export tabular summaries suitable for reporting or downstream analysis.

4. **Settlement-class reclassification**
   - Recode detailed categorical classes into broader, interpretable groups.
   - Preserve explicit NoData handling and integer categorical outputs.

5. **Grid alignment and overlay**
   - Align categorical rasters to the population grid using nearest-neighbour resampling.
   - Avoid inappropriate bilinear or cubic interpolation for categorical classes.

6. **Population by settlement class**
   - Combine the aligned population and settlement rasters.
   - Summarise population totals and proportions by class within each boundary.
   - Run closure checks to confirm that class totals are consistent with boundary totals.

7. **Outputs and QA artefacts**
   - Write reproducible CSV summaries, figures, GIS layers, and JSON/metadata checks.
   - Keep intermediate and final outputs clearly separated.

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

Core Python packages used in the workflow include:

- `geopandas`
- `rasterio`
- `pandas`
- `numpy`
- `matplotlib`

Depending on the exact environment, the workflow may also require geospatial dependencies installed through Conda or Mamba, especially GDAL-related packages used by `rasterio` and `geopandas`.

## Notes on reproducibility

This repository is intended to demonstrate workflow design, QA logic, and geospatial data-handling decisions. For new applications, update the input paths, boundary layer, raster sources, classification legend, and output names to match the target study area and datasets.

Raw geospatial datasets can be large and licensing conditions vary. When publishing or sharing the repository, keep only code, documentation, lightweight derived outputs, and non-sensitive QA artefacts unless redistribution is clearly permitted.

## Skills demonstrated

- Geospatial data processing in Python
- Raster-vector integration
- CRS, grid, and metadata quality assurance
- Zonal statistics and boundary-based summaries
- Categorical raster reclassification and alignment
- Reproducible analysis organisation
- Policy-relevant spatial reporting and visualisation
