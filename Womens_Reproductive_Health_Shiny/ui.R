#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
 
  titlePanel("Ranking Percentage of Educational Attainment for Women based on Country GDP"),
  
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectContinent")
    ),
  
    mainPanel(
      leafletOutput("gdp_education_map"),
    )
  )
))