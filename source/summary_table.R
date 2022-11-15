fertility_rate <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Fertality_rate.csv")
gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")
education <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Educational.csv")

fertility_rate <- fertility_rate %>% 
  select(Country.Name, X2020)

gdp <- gdp %>% 
  select(Country.Name, X2020)

education <- replace(education, education == "-", 0) %>% 
  mutate(years_2016_2021 = as.numeric(X2016) + as.numeric(X2017) + as.numeric(X2018) + as.numeric(X2019) +as.numeric(X2021) , na.rm = T) %>% 
  rename(Country.Name = Time.period) %>% 
  select(Country.Name, years_2016_2021)

merged <- fertility_rate %>% 
  left_join(gdp, by = "Country.Name") %>% 
  left_join(education, by = "Country.Name") %>% 
  rename(fertility = X2020.x, gdp = X2020.y, education = years_2016_2021)