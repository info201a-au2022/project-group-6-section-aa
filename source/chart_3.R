# mapchart with gdp and education attainment
library(dplyr)
library(ggplot2)
library(tidyverse)

mortality_rate <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Mortality%20rate.csv")

mortality_rate <- mortality_rate %>% 
  select(Country.Name, X2020)



world_shape <- map_data("world") %>% 
  rename(Country.Name = region) %>% 
  left_join(mortality_rate, by = "Country.Name")
ggplot(world_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = X2020),
    color = "white",
    linewidth = .1
  ) +
  coord_map() +
  scale_fill_continuous(low = "#132B43", high = "Blue") +
  labs(fill = "Mortality Rate", 
       title = "Mortality Rate world map") 

