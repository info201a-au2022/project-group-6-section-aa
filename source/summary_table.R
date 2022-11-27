library(dplyr)

gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")
education <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Educational.csv")
fertility <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Fertality_rate.csv")
mortality <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Mortality%20rate.csv")
reproductive <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/reproductiveAgeWomen.csv")

new_gdp <- gdp[-c(260, 96, 182, 199, 247, 246, 245, 244, 243, 242, 241, 240, 239, 104, 66, 143, 171, 250, 64, 103, 157, 141), ]
new_gdp <- new_gdp %>% 
  select(Country.Name, X2020) %>% 
  rename(years = X2020)
new_gdp <- new_gdp %>%
  mutate(indicator = NA)
vec_1 <- "gdp"
new_gdp <- new_gdp %>%
  mutate(indicator = vec_1)

new_education <- education %>% 
  replace(education == "-", 0) %>% 
  mutate(years = as.numeric(X2016) + as.numeric(X2017) + as.numeric(X2018) + as.numeric(X2019) +as.numeric(X2021) , na.rm = T) %>% 
  rename(Country.Name = Time.period) %>% 
  select(Country.Name, years)
new_education <- new_education %>% 
  mutate(indicator = NA)
vec_2 <- "education"
new_education <- new_education %>%
  mutate(indicator = vec_2)

new_fertility <- fertility %>% 
  select(Country.Name, X2020) %>% 
  rename(years = X2020)
new_fertility <- new_fertility %>% 
  mutate(indicator = NA)
vec_3 <- "fertility"
new_fertility <- new_fertility %>%
  mutate(indicator = vec_3)  

new_mortality <- mortality %>% 
  select(Country.Name, X2020) %>% 
  rename(years = X2020)
new_mortality <- new_mortality %>% 
  mutate(indicator = NA)
vec_4 <- "mortality"
new_mortality <- new_mortality %>%
  mutate(indicator = vec_4)   

new_reproductive <- reproductive %>% 
  rename(Country.Name = Location, years = First.Tooltip)
new_reproductive <- new_reproductive %>% 
  select(Country.Name, years)
new_reproductive <- new_reproductive %>% 
  mutate(indicator = NA)
vec_5 <- "reproductive"
new_reproductive <- new_reproductive %>%
  mutate(indicator = vec_5) 

merged <- bind_rows(new_gdp, new_education, new_fertility, new_mortality, new_reproductive)

summary_table <- merged %>% 
  group_by(indicator) %>% 
  filter(years == max(years, na.rm = TRUE)) %>% 
  pull(Country.Name, indicator)

View(summary_table)
