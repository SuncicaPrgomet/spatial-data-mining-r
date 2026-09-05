
# Floating Car Data (FCD) Traffic Analysis

Analysis of real vehicle GPS trace data containing over **44 million position records**, combined with road network geometry represented as polygons connecting lane segments.

## Analysis

- Parsed nested road geometry structures to extract coordinate paths for individual road segments
- Reconstructed and visualized the road network from geographic traces
- Computed per-lane vehicle counts and road segment lengths
- Derived a traffic density measure based on road length and vehicle count
- Applied **k-means clustering** to group road segments by traffic density
- Extracted individual vehicle trajectories by matching lane IDs with road geometry
- Built a **decision tree regression model** (`rpart`) to predict road segment length from traffic density
- Evaluated regression predictions using a train/test split and predicted-vs-actual visualization

## Tech Stack

R · `rpart` · clustering · regression · geospatial data analysis
