library(dplyr)
library(ggplot2)
library(plotly)
library(tidyverse)

family_planning <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/reproductiveAgeWomen.csv")
maternal_mortality <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/maternalMortalityRatio.csv")

family_planning <- family_planning %>% 
  rename(Country.Name = Location, perc = First.Tooltip)
new_planning <- family_planning %>% 
  select(Country.Name, perc)

maternal_mortality$First.Tooltip <- str_replace(maternal_mortality$First.Tooltip, "\\[.*\\]", "")
maternal_mortality$First.Tooltip <- as.numeric(as.character(maternal_mortality$First.Tooltip))
new_mortality <- maternal_mortality %>% 
  rename(Country.Name = Location, X2017 = First.Tooltip) %>% 
  filter(Period == 2017) %>% 
  select(Country.Name, X2017)

planning_mortality <- left_join(new_planning, new_mortality, by = "Country.Name")

planning_mortality_long <- planning_mortality %>% 
  pivot_longer(!Country.Name, names_to = "Type", values_to = "Count")
barchart_planning_mortality <- ggplot(planning_mortality_long, aes(x = Country.Name, y = Count, fill = Type)) +
  geom_col(position = position_dodge(0.7)) +
  labs(title = "Family planning versus Maternal mortality")

plot(barchart_planning_mortality)