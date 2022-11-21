library(dplyr)

gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")
education <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Educational.csv")
fertility <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Fertality_rate.csv")
mortality <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Mortality%20rate.csv")
reproductive <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/reproductiveAgeWomen.csv")

new_gdp <- gdp %>% 
  select(Country.Name, X2020) %>% 
  rename(years = X2020)
new_gdp <- new_gdp %>%
  mutate(indicator = NA)
# take it out of the vector
vec_1 <- "gdp"
new_gdp <- new_gdp %>%
  mutate(indicator = vec_1)

# Testing
hi <- gdp %>% 
  select(Country.Name, X2020) %>% 
  filter(X2020 == max(X2020), na.rm = TRUE)

testtest <- gdp[, c('Country.Name', 'X2020')]
max(testtest$X2020, na.rm = TRUE)



?type
#type(testtest$X2020)

View(gdp)

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

# Testing
hello <- education %>% replace(education == "-", 0) %>% 
  mutate(years = as.numeric(X2016) + as.numeric(X2017) + as.numeric(X2018) + as.numeric(X2019) +as.numeric(X2021) , na.rm = T) %>% 
  rename(Country.Name = Time.period) %>% 
  select(Country.Name, years) %>% 
  summarize(years = max(years), na.rm = TRUE)

new_fertility <- fertility %>% 
  select(Country.Name, X2020) %>% 
  rename(years = X2020)
new_fertility <- new_fertility %>% 
  mutate(indicator = NA)
vec_3 <- "fertility"
new_fertility <- new_fertility %>%
  mutate(indicator = vec_3)  

# Testing
bye <- fertility %>% 
  select(Country.Name, X2020) %>% 
  filter(X2020 == max(X2020), na.rm = TRUE)

new_mortality <- mortality %>% 
  select(Country.Name, X2020) %>% 
  rename(years = X2020)
new_mortality <- new_mortality %>% 
  mutate(indicator = NA)
vec_4 <- "mortality"
new_mortality <- new_mortality %>%
  mutate(indicator = vec_4)   

# Testing
bye_2 <- mortality %>% 
  select(Country.Name, X2020) %>% 
  summarize(X2020 = max(X2020), na.rm = TRUE)

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

summary <- merged %>% 
  group_by(indicator) %>% 
  summarize(years = max(years, na.rm = TRUE)) %>% 
  filter(years == max(years)) 

# Pull(Country.Name)
# Arrange(Country.Name)
