
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(plotly)
library(tidyr) 
library(leaflet)
library(sf)
library(rgdal)
library(tidyverse)



#Tab2: How does a country's GDP impact women’s education level?
#data wrangling for map ------------------------------#
#Create dataframe
gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")
gdp %>% 
  select(Country.Name:Indicator.Name, X2020) %>% 
  rename (GDP = X2020) -> GDP_2020
GDP_2020_to_combine_map <- GDP_2020 %>% 
  rename (NAME = Country.Name) 

education <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Educational.csv")
new_education <- education %>% 
  replace(education == "-", 0) %>% 
  mutate(avg_educ_attainment_2016_2021 = as.numeric(X2016) + as.numeric(X2017) + as.numeric(X2018) + as.numeric(X2019) +as.numeric(X2021) , na.rm = T) %>% 
  rename(Country.Name = Time.period) %>% 
  select(Country.Name,avg_educ_attainment_2016_2021) %>% 
  drop_na()
gdp_educational_attainment <- left_join(GDP_2020, new_education, by = "Country.Name") %>% 
  drop_na() 
n_gdp_educational_attainment<- gdp_educational_attainment[-c(32, 50, 62, 69, 77), ]
n_gdp_educational_attainment %>% 
  arrange(-GDP) -> arranged_gdp_educational_attainment
vector_GDP_ranking = c(1:74)
vector_education_ranking = c(1:74)
vector_overall_ranking = c(1:74)
ranked_gdp_educational_attainment <- arranged_gdp_educational_attainment %>% 
  mutate(GDP_ranking = vector_GDP_ranking)
ranked1_gdp_educational_attainment <- ranked_gdp_educational_attainment %>% 
  arrange(-avg_educ_attainment_2016_2021) %>% 
  mutate(Education_ranking = vector_education_ranking) %>% 
  mutate(overall_ranking = Education_ranking/GDP_ranking) %>% 
  arrange(-overall_ranking) %>% 
  mutate(Rank = vector_overall_ranking) %>% 
  rename(NAME = Country.Name)
#Create shapefile

world_spdf <- read_sf(dsn = "/Users/keerthirenduchintala/Documents/info201/project-group-6-section-aa/data/world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.shp", layer = "TM_WORLD_BORDERS_SIMPL-0.3")
combined_df<- left_join(world_spdf, GDP_2020_to_combine_map, by = "NAME") %>% 
  drop_na()
combined2 <- left_join(combined_df, ranked1_gdp_educational_attainment, by = "NAME")
Continent <- c("South America", "Africa", "Asia", "Europe", "Asia", "Africa", "North America", "South America", "Australia", "Asia", "South America", "North America", "Asia", "Europe", "Europe", "Europe", "Africa", "Australia", "South America", "Europe", "Asia", "North America", "Asia", "Asia", "Africa", "Asia", "Asia", "Asia", "South America", "North America", "Africa", "Africa", "Africa", "South America", "North America", "Africa", "South America", "Europe", "Europe", "Africa", "North America", "North America", "South America", "Europe", "Africa", "Europe", "South America", "Africa", "Europe", "Europe", "Asia", "Australia", "Europe", "Africa", "Europe", "Africa", "North America", "North America", "Europe", "Asia", "Europe", "South America", "Africa", "South America", "North America", "South America", "Europe", "Europe", "Europe", "Asia", "Asia", "Europe", "Africa", "Asia", "Asia", "North America", "Asia", "Africa", "Australia", "Asia", "Asia", "Asia", "Europe", "Europe", "Europe", "Europe", "Africa", "Asia", "Africa", "Africa", "Africa", "Africa", "Europe", "Asia", "Asia", "South America", "Asia", "Africa", "Africa", "Australia", "Africa", "South America", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Australia", "Africa", "Europe", "Europe", "Asia", "Australia", "South America", "South America", "Australia", "South America", "South America","Asia", "Europe", "North America", "South America", "Australia", "Africa", "Asia", "Europe", "Asia", "North America", "Africa", "Asia", "Africa", "Africa", "Africa", "Africa", "Africa", "Europe", "Africa", "Asia", "Africa", "Europe", "Africa", "Europe", "Europe", "South America", "Asia", "Asia"," Australia","Africa", "Africa", "Africa", "Australia", "Africa", "Europe", "Europe", "North America", "Africa", "South America", "Asia", "Africa", "Africa", "Africa", "Africa", "Asia", "Asia", "Asia", "Australia", "Australia", "Europe", "Europe", "Europe")
combined2 %>% 
  mutate(Continent = Continent) -> combined3
Gdp_education_df <- combined3 %>% 
  rename(GDP = GDP.x, 
         EducationRank = Education_ranking,
         RankEducationbasedonGDP = Rank)
Gdp_education_df[148,24] <- "Australia"
#---------------------------------------# end data wrangling for interactive map
#---------------------# Data wrangling for scatterplot
ibrary(dplyr)
library(ggplot2)

## Datasets of education and fertility
#dataset1 = new_education
fertility <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/Fertality_rate.csv")

## Get the education and fertility data


new_fertility <- fertility %>%
select(Country.Name, X2020) %>% 
  rename(BirthsPerWoman = X2020)

education_fertility <- left_join(new_education, new_fertility, by = "Country.Name")
education_fertility %>% 
  drop_na() -> education_fertility_df

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




# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$selectContinent <- renderUI({
    selectInput("Continent", "Choose a Continent", choices = unique(Gdp_education_df$Continent))
  })
  
  continent_data <- reactive({
    mapContinent <- Gdp_education_df %>% 
      filter(Continent %in% input$Continent)
    
    palette = palette <- colorNumeric(palette = "magma", 
                                      domain = mapContinent$GDP, 
                                      na.color= "transparent")
    leaflet(mapContinent) %>% 
      addProviderTiles("CartoDB.Positron") %>% 
      setView(lng = 0, lat = 25.7502, zoom = 1.0) %>% 
      addPolygons(
        stroke = FALSE,
        fillOpacity = 0.7,
        smoothFactor = 0.5,
        fillColor = ~palette(mapContinent$GDP),
        label = label <- paste(
          "Country:", mapContinent$NAME, "<br/>",
          "GDP Ranking:", mapContinent$GDP_ranking, "<br/>",
          "Education Ranking:", mapContinent$EducationRank, "<br/>",
          "Overall Ranking:", mapContinent$RankEducationbasedonGDP, "<br/>", 
          sep = "") %>% 
          lapply(htmltools::HTML),
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto")) %>% 
      addLegend(pal = palette, 
                values = Gdp_education_df$GDP, 
                opacity = 0.9, title = "GDP", 
                position = "bottomleft")
  })
  
  output$gdp_education_map <- renderLeaflet({
    continent_data()
  })
})


  
    

