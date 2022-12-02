library(dplyr)
library(ggplot2)

## Datasets of education and fertility
education <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Educational.csv")
fertility <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Fertality_rate.csv")

## Get the education and fertility data
new_education <- education %>% 
  replace(education == "-", 0) %>% 
  mutate(levels = as.numeric(X2016) + as.numeric(X2017) + as.numeric(X2018) + as.numeric(X2019) +as.numeric(X2021) , na.rm = T) %>% 
  rename(Country.Name = Time.period) %>% 
  select(Country.Name, levels)

new_fertility <- fertility %>% 
  select(Country.Name, X2020)

education_fertility <- left_join(new_education, new_fertility, by = "Country.Name")

Plot_education_fertility <- function() {
  scatterplot <- ggplot(data = education_fertility) +
    geom_point(mapping = aes(x = levels, y = X2020)) +
    labs(
      x = "Education Levels",
      y = "Fertility Rate",
      title = "Education Level versus Fertility Rate"
    )
  return(scatterplot)
}

Plot_education_fertility()


