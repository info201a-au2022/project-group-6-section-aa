# scatterplot with gdp and education attainment
library(dplyr)
library(ggplot2)

education <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Educational.csv")
gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")

new_gdp_values <- gdp %>% 
  select(Country.Name, X2020)

new_education <- education %>% 
  select(Country.Name, years_2016_2021)

gdp_education <- left_join(new_education, new_gdp_values, by = "Country.Name") %>% 
  rename(education_attainment = years_2016_2021, gdp = X2020)

gdp_education_long <- gdp_education %>% pivot_longer(!Country.Name, names_to = "Type",values_to = "Count" )
barchart_gdp_education <- ggplot(gdp_education_long, aes(x = Country.Name, y = Count, fill = Type)) +
  geom_col(position = position_dodge(0.7))
  labs(title = "GDP versus Fertility rate")

plot(barchart_gdp_education)

