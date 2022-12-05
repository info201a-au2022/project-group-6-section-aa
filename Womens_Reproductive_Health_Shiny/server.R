
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
library(ggplot2)




#data wrangling for map ------------------------------#
#Create dataframe
gdp <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/GDP(current%20%20).csv")
GDP_2020 <- gdp %>% 
  select(Country.Name:Indicator.Name, X2020) %>% 
  rename (GDP = X2020) 
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
arranged_gdp_educational_attainment <- n_gdp_educational_attainment %>% 
  arrange(-GDP) 
vector_GDP_ranking <- c(1:74)
vector_education_ranking <- c(1:74)
vector_overall_ranking <- c(1:74)
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

world_spdf <- read_sf(dsn = "./world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.shp", layer = "TM_WORLD_BORDERS_SIMPL-0.3")
shape_file_combined_df<- left_join(world_spdf, GDP_2020_to_combine_map, by = "NAME") %>% 
  drop_na()
interactive_map_combined <- left_join(shape_file_combined_df, ranked1_gdp_educational_attainment, by = "NAME")
Continent <- c("South America", "Africa", "Asia", "Europe", "Asia", "Africa", "North America", "South America", "Australia", "Asia", "South America", "North America", "Asia", "Europe", "Europe", "Europe", "Africa", "Australia", "South America", "Europe", "Asia", "North America", "Asia", "Asia", "Africa", "Asia", "Asia", "Asia", "South America", "North America", "Africa", "Africa", "Africa", "South America", "North America", "Africa", "South America", "Europe", "Europe", "Africa", "North America", "North America", "South America", "Europe", "Africa", "Europe", "South America", "Africa", "Europe", "Europe", "Asia", "Australia", "Europe", "Africa", "Europe", "Africa", "North America", "North America", "Europe", "Asia", "Europe", "South America", "Africa", "South America", "North America", "South America", "Europe", "Europe", "Europe", "Asia", "Asia", "Europe", "Africa", "Asia", "Asia", "North America", "Asia", "Africa", "Australia", "Asia", "Asia", "Asia", "Europe", "Europe", "Europe", "Europe", "Africa", "Asia", "Africa", "Africa", "Africa", "Africa", "Europe", "Asia", "Asia", "North America", "Asia", "Africa", "Africa", "Australia", "Africa", "South America", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Australia", "Africa", "Europe", "Europe", "Asia", "Australia", "South America", "South America", "Australia", "South America", "South America","Asia", "Europe", "North America", "South America", "Australia", "Africa", "Asia", "Europe", "Asia", "North America", "Africa", "Asia", "Africa", "Africa", "Africa", "Africa", "Africa", "Europe", "Africa", "Asia", "Africa", "Europe", "Africa", "Europe", "Europe", "South America", "Asia", "Asia"," Australia","Africa", "Africa", "Africa", "Australia", "Africa", "Europe", "Europe", "North America", "Africa", "South America", "Asia", "Africa", "Africa", "Africa", "Africa", "Asia", "Asia", "Asia", "Australia", "Australia", "Europe", "Europe", "Europe")
combined_with_continents <- interactive_map_combined %>% 
  mutate(Continent = Continent) 
Gdp_education_df <- combined_with_continents %>% 
  rename(GDP = GDP.x, 
         EducationRank = Education_ranking,
         RankEducationbasedonGDP = Rank)
Gdp_education_df[148,24] <- "Australia"

#---------------------------------------# end data wrangling for interactive map
#--------------------------# Data wrangling for bar chart

family_planning <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/reproductiveAgeWomen.csv")
maternal_mortality <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-aa/main/data/maternalMortalityRatio.csv")
rank_family_planning <- c(1:119)
rank_category <- c("Top 10", "Top 10","Top 10","Top 10","Top 10","Top 10","Top 10","Top 10","Top 10","Top 10","Rank 11-30", "Rank 11-30", "Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 11-30","Rank 31-50", "Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 31-50","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 51-70","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 71-90","Rank 91-110", "Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Rank 91-110","Bottom 9","Bottom 9","Bottom 9","Bottom 9","Bottom 9","Bottom 9","Bottom 9","Bottom 9","Bottom 9")

family_planning <- family_planning %>%
  rename(Country.Name = Location, percentage_fulfilled_family_planning = First.Tooltip)

new_planning <- family_planning %>%
  select(Country.Name, percentage_fulfilled_family_planning) %>%
  arrange(-percentage_fulfilled_family_planning) %>%
  mutate(family_planning_rank = rank_family_planning) %>%
  mutate(Rank_category = rank_category)
maternal_mortality$First.Tooltip <- str_replace(maternal_mortality$First.Tooltip, "\\[.*\\]", "")
maternal_mortality$First.Tooltip <- as.numeric(as.character(maternal_mortality$First.Tooltip))
new_mortality <- maternal_mortality %>%
  mutate(maternal_mortality_ratio = (First.Tooltip / 10)) %>%
  rename(Country.Name = Location) %>%
  filter(Period == 2017) %>%
  select(Country.Name, maternal_mortality_ratio) 

planning_mortality <- left_join(new_planning, new_mortality, by = "Country.Name")
planning_mortality[100, "Country.Name"] <- "Cote dIvoire"
planning_mortality_long <- planning_mortality %>%
  pivot_longer(c("percentage_fulfilled_family_planning", "maternal_mortality_ratio"), names_to = "Indicator", values_to = "Value")
planning_mortality_long$family_planning_rank[duplicated(planning_mortality_long$family_planning_rank)] <- NA

#-----------------------------# END DATA WRANGLING FOR BAR CHART
#--------------------# Data wrangling for scatterplot
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
Continents <- c("South America", "Europe", "Australia", "Europe", "Asia", "Europe", "Asia", "Europe", "Asia", "Europe", "South America", "Europe", "Africa", "North America", "South America", "South America", "North America","Europe", "Europe", "Europe", "North America", "South America", "South America", "Europe", "Australia", "Europe", "Europe", "Asia", "Europe", "Europe", "Africa", "South America", "Europe", "Asia", "Europe", "Asia", "Asia", "Europe", "Europe", "Asia", "Africa", "Europe", "North America", "Africa", "Europe", "Australia", "North America", "Europe", "Asia", "South America", "South America", "Europe", "Europe", "Asia", "Europe", "Africa", "Asia", "Africa", "Europe", "Asia", "Europe", "Africa", "Asia", "Europe", "Asia", "Africa", "Europe", "Europe", "Asia", "Asia", "Asia", "Europe", "North America", "South America", "Asia","World", "Africa")

scatterplot_df <- education_fertility_df %>% 
  mutate(Continent = Continents) 
fixed_scatterplot_df <- scatterplot_df[-c(47, 63, 76),] %>% 
  rename(Continents = Continent)
#-----------------# end scatterplot data wrangling 
#--------------------------# end all data wrangling

#------------------# DEFINING SERVER LOGIC
#------# Define server logic required to draw map
shinyServer(function(input, output) {
  output$selectContinent <- renderUI({
    selectInput("Continent", "Choose a Continent", choices = unique(Gdp_education_df$Continent))
  })
  
  continent_data <- reactive({
    mapContinent <- Gdp_education_df %>% 
      filter(Continent %in% input$Continent)
    
    palette <- colorQuantile(palette = "magma", 
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
#----------------------# END MAP
#------------# DEFINE SERVER LOGIC REQUIRED TO DRAW BARCHART
  output$selectRank_category <- renderUI({
    selectInput("Rank_category", "Choose rank category", choices = unique(planning_mortality$Rank_category))
  })
  barchart <- reactive({
    plot_rank <- planning_mortality %>%
      filter(Rank_category %in% input$Rank_category) %>%
      pivot_longer(c("percentage_fulfilled_family_planning", "maternal_mortality_ratio"), names_to = "Indicator", values_to = "Value")
    
    bar_chart <- ggplot(plot_rank, aes(x = Country.Name, y = Value, fill = Indicator)) +
      geom_col(position = position_dodge(0.7)) +
      labs(title = "Family planning versus Maternal mortality") 
      
    ggplotly(bar_chart) 
  })
  output$family_mortality_barchart <- renderPlotly({
    barchart()
  })
#----------------------# END BARCHART
#-------------------# Define Define server logic required to draw scatterplot
  
  output$selectContinents <- renderUI({
    selectInput("Continents", "Choose a Continent", choices = unique(fixed_scatterplot_df$Continents))
  })
  
  scatterplot <- reactive({
    plotContinent <- fixed_scatterplot_df %>% 
      filter(Continents %in% input$Continents)
    
    scatter_plot <- ggplot(plotContinent, aes(x = avg_educ_attainment_2016_2021, y = BirthsPerWoman)) +
      geom_point(aes(color = Country.Name)) +
      labs(
        x = "Education Levels",
        y = "Fertility Rate",
        title = "Education Level versus Fertility Rate in selected Continent")
    ggplotly(scatter_plot)
    
  })
  
  output$fertility_education_scatterplot <- renderPlotly({
    scatterplot()
  })
})
#-----------------------# END SCATTERPLOT


  
    

