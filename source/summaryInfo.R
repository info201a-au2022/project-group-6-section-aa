## Fertility Rate
library(dplyr)

fertility_rate <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Fertality_rate.csv")
gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")
education <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Educational.csv")
mortality_rate <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Mortality%20rate.csv")
reproductive_age <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Women%E2%80%99s%20Reproductive%20Age.csv")
gdpppp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/gdpppp.csv")

new_gdp <- gdp[-c(260, 96, 182, 199, 247, 246, 245, 244, 243, 242, 241, 240, 239, 104, 66, 143, 171, 250, 64, 103, 157, 141), ]

summary_info <- list()
summary_info$observation_fertility <- nrow(fertility_rate)
summary_info$observation_gdp <- nrow(gdp)
summary_info$observation_education <- nrow(education)
summary_info$observation_mortality <- nrow(mortality_rate)
summary_info$observation_reproductive <- nrow(reproductive_age)

summary_info$highest_fertility <- fertility_rate %>% 
  select(Country.Name, X2020) %>%
  filter(X2020 == max(X2020, na.rm = T)) %>% 
  pull(Country.Name)

summary_info$highest_gdp <- new_gdp %>% 
  select(Country.Name, X2020) %>%
  filter(X2020 == max(X2020, na.rm = T)) %>% 
  pull(Country.Name)

summary_info$lowest_gdp <- new_gdp %>% 
  select(Country.Name, X2020) %>%
  filter(X2020 == min(X2020, na.rm = T)) %>% 
  pull(Country.Name)

education <- replace(education, education == "-", 0) %>% 
  mutate(years_2016_2021 = as.numeric(X2016) + as.numeric(X2017) + as.numeric(X2018) + as.numeric(X2019) +as.numeric(X2021) , na.rm = T) %>% 
  rename(Country.Name = Time.period)
summary_info$highest_education <- education %>%  
  filter(years_2016_2021 == max(years_2016_2021, na.rm = T)) %>% 
  pull(Country.Name)


summary_info$highest_mortality <- mortality_rate %>% 
  select(Country.Name, X2020) %>%
  filter(X2020 == max(X2020, na.rm = T)) %>% 
  pull(Country.Name)






