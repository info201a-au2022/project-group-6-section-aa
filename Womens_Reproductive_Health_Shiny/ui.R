#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
  #theme = bs_theme(version = 4, bootswatch = "Morph"),
page_one <- tabPanel(
   "First Page",
   titlePanel("Ranking Percentage of Educational Attainment for Women based on Country GDP"),
   sidebarLayout(
     sidebarPanel(
       uiOutput("selectContinent")
     ),
     mainPanel(
       leafletOutput("gdp_education_map"),
     )
   )
 )
page_two <- tabPanel(
  "Second Page",
  titlePanel("hi"),
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectRank_category")
    ),
    mainPanel(
      plotlyOutput("family_mortality_barchart"),
    )
  )
)

page_three <- tabPanel(
  "Third Page",
  titlePanel("Correlation between Percentage of Educational Attainment for Women and Fertility Rate"),
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectContinents")
    ),
    mainPanel(
      plotlyOutput("fertility_education_scatterplot"),
    )
  )
)

ui <- navbarPage(
  "My App",
  page_one,
  page_two,
  page_three
)

  
 
