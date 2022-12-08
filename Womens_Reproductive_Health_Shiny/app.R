#install.packages('rsconnect')

library(shiny)
library(plotly)
library(tidyr) 
library(leaflet)
library(sf)
library(rgdal)
library(tidyverse)
library(ggplot2)
library(shinythemes)



# Define UI for application 
source("ui.R")

# Define Server logic
source("server.R")

# Run the application 
shinyApp(ui = ui, server = server)




