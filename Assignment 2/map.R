library(tidyverse)
library(countrycode)
library(maps)
library(dplyr)
library(scales)
library(plotly)

data <- read.csv("unicef_indicator_1.csv")

# Create the world map
world_map <- map_data("world")

# Merge the data with the map data
merged_data <- full_join(world_map, data, by = c("region" = "country"))

# Create the map plot
map_plot <- ggplot(data = merged_data) +
  aes(x = long, y = lat, group = group, fill = obs_value) +
  geom_polygon() +
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "grey") +
  labs(
    title = "Children living in households with income below the national poverty line in 2020",
    caption = "Source: Our World In Data",
    x = "Longitude",
    y = "Latitude",
    fill = "Percentage"
  ) +
  theme_bw()

# Display the map plot
map_plot



