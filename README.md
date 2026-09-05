Spatial Data Mining in R

A set of R analyses from a data mining course, covering two substantial spatial/geographic datasets — Adriatic Sea wind vector fields and floating car (GPS) traffic data — along with foundational exercises in R fundamentals, matrix operations, and clustering.

Main analyses
Meteorological wind field analysis (Adriatic Sea)

A vector field of wind measurements over the Adriatic Sea: a 2,212 × 54,056 matrix combining u/v wind components across ~1,100 geographic points (given as longitude/latitude pairs) over time.

Parsed and separated the combined u/v vector components from the raw measurement matrix
Visualized wind vectors as arrow/quiver plots over the measurement locations (pracma, fields)
Computed wind speed magnitude (sqrt(u² + v²)) at a given point across the full time series, and plotted its distribution and evolution over time
Investigated spatial correlation structure between measurement points as a function of geographic distance
Computed per-location standard deviation of wind speed across time and visualized it as a spatial heatmap (lattice::levelplot)
Identified and removed a geographic outlier point before exporting the cleaned dataset to CSV
Floating car data (FCD) traffic analysis

Real vehicle GPS trace data — over 44 million position records — combined with road network geometry (roads represented as polygons connecting lane segments).

Parsed nested list-of-lists road geometry data to extract coordinate paths for each road segment, and reconstructed/plotted the road network from these traces
Computed per-lane vehicle counts and road segment lengths, deriving a traffic density measure (length per vehicle) for each lane
Applied k-means clustering to group road segments into density categories
Extracted a single vehicle's trajectory from the dataset by matching its lane ID against the parsed road geometry
Built a decision tree regression (rpart) predicting road segment length from traffic density, with a train/test split and a predicted-vs-actual evaluation plot
Supporting exercises

A few additional files cover foundational R skills used throughout the analyses above: Cluster_Analysis (k-means and decision tree regression applied to the classic iris dataset, as a simpler testbed before applying the same techniques to traffic data), Data_Exploration (basic descriptive statistics on the built-in women dataset), Matrix_Operations (matrix decompositions, multidimensional arrays, list structures), and Introduction_to_R_Basics (variables, vectors, sequences). These are included for completeness but are standard course exercises rather than original analysis.

Tech stack

R · pracma · fields · lattice · rpart · base R matrix/statistical functions

Notes

The wind and traffic datasets are not included in this repository (large, course-provided files loaded from local .RData/.csv sources). The value of this collection is in the analysis approach — parsing nested/non-tabular geographic data structures, deriving meaningful spatial features (density, magnitude, correlation-by-distance), and applying clustering and regression to real, messy geospatial data — rather than in the raw data itself.
