#install.packages('rsconnect')
install.packages("bslib")
library(shiny)
library(bslib)




# Define UI for application that draws a histogram
source("ui.R")

# Define Server logic
source("server.R")

# Run the application 
shinyApp(ui = ui, server = server)

rsconnect::setAccountInfo(name='womenshealth', 
                          token='766E313306714232614E9F52E3B4C389', 
                          secret='h7CtmQ4Fd0tGDfqjJlhWfU9ZlTiUGnAfcrK276YE')


