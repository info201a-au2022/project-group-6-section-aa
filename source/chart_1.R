# scatterplot with gdp and fertality rate
library(dplyr)
library(ggplot2)

fertility_rate <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Fertality_rate.csv")
gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")

new_gdp_values <- gdp %>% 
  select(Country.Name, X2020)

new_fertility <- fertility_rate %>% 
  select(Country.Name, X2020)

gdp_fertility <- left_join(new_fertility, new_gdp_values, by = "Country.Name") %>% 
  rename(fertility = X2020.x, gdp = X2020.y)

scatterplot_gdp_fertility <- ggplot(data = gdp_fertility) +
  geom_point(mapping = aes(x = gdp, y = fertility)) +
  labs(title = "GDP versus Fertility rate")
  
plot(scatterplot_gdp_fertility)


