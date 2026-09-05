# Adriatic Sea Wind Field Analysis

Spatial analysis of wind measurements over the **Adriatic Sea**, based on a large vector field containing u/v wind components across approximately **1,100 geographic locations** over time.

The original measurement matrix contains **2,212 × 54,056 values**.

## Analysis

- Parsed and separated the combined **u/v wind vector components** from the raw measurement matrix
- Visualized wind direction and magnitude using **arrow/quiver plots** over geographic measurement locations
- Computed wind speed magnitude using `sqrt(u² + v²)`
- Analyzed wind speed distributions and their evolution over time
- Investigated **spatial correlation** between measurement locations as a function of geographic distance
- Computed per-location standard deviation of wind speed across time
- Visualized spatial variability using heatmaps with `lattice::levelplot`
- Identified and removed a geographic outlier before exporting the cleaned dataset

## Tech Stack

R · `pracma` · `fields` · `lattice` · spatial data analysis · statistical analysis

## Data

The original wind dataset is not included in this repository because it was a large course-provided dataset loaded locally during the analysis.
