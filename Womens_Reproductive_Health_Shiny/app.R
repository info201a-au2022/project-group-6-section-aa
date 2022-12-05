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

rsconnect::setAccountInfo(name='womenshealth', 
                          token='766E313306714232614E9F52E3B4C389', 
                          secret='h7CtmQ4Fd0tGDfqjJlhWfU9ZlTiUGnAfcrK276YE')


