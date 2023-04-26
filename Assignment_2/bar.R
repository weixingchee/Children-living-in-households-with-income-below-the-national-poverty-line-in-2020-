library(tidyverse)
library(countrycode)
library(maps)
library(dplyr)
library(scales)
library(plotly)

data <- read.csv("unicef_indicator_1.csv")

unicef_data_african <- filter(data, country %in% c("Zimbabwe", "Togo", "Burundi", "Madagascar"))

bar_chart <- ggplot(unicef_data_african, aes(x = obs_value, y = reorder(country, -obs_value))) +
  geom_bar(stat = "identity", fill = c("lightblue", "blue", "mediumblue", "darkblue"), width = 0.5) +
  labs(title = "Poverty Percentage of African Countries in 2020", x = "Poverty", y = "Country") +
  theme(plot.title = element_text(size = 16, face = "bold"),
        axis.title = element_text(size = 14, face = "bold"),
        axis.text.y = element_text(size = 10))

bar_chart  # Display the plot
