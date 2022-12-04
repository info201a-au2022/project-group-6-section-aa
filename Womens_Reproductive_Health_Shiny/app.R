library(shiny)

# Define UI for application that draws a histogram
source("ui.R")

# Define Server logic
source("server.R")

# Run the application 
shinyApp(ui = ui, server = server)


