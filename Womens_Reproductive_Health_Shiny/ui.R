#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)
  #theme = bs_theme(version = 4, bootswatch = "Morph"),
page_one <- tabPanel(
  "Introduction",
  titlePanel(strong("Intoducing our Project!")),
  sidebarLayout(
    sidebarPanel(
      h3("Group Members!"),
      hr(),
      
      h5("Keerthi Renduchintala"),
      h6("krendu@uw.edu"),
      br(),
      
      h5("Eunji Shin"),
      h6("eunjiii@uw.edu"),
      br(),
      
      h5("Zhien He"),
      h6("hz123@uw.edu"),
      br(),
    ),
    mainPanel(
    img(src = "/Users/keerthirenduchintala/Documents/info201/project-group-6-section-aa/Womens_Reproductive_Health_Shiny/www/introduction page picture.png", height = 350, width = 275),
    h2(strong("Our Main Question:")),
    h3("What factors and situations give rise to outcomes that are known to impact Womens Reproductive Health?"),
    p("Women's health is an important cornerstone of the health of all people and a prerequisite and foundation for sustainable human development. There are many factors that can lead to maternal related health outcomes, such as a country's GDP, women’s education levels, fulfillment of family planning, and maternal mortality rates. These factors ultimately contribute to not only individual female development, but also to national economic development.And thus, we aim to investigate the relationships between these factors as a indicator of Maternal Health."),
    h4("The Questions that we aim to answer through our interactive plots are:"),
    p(strong("Does a country's GDP impact percentage of education attainment for women?")),
    p(strong("How does the fulfillment of family planning impact maternal mortality?")),
    p(strong("How does women’s education level impact their fertility rate (births per woman)?"))
  )
)
)
page_two <- tabPanel(
   "GDP",
   titlePanel(strong("Do Wealthy Nations Have More Educated Women?")),
   sidebarLayout(
     sidebarPanel(
       uiOutput("selectContinent"),
       h6("GDP Ranking is based on the highlighted countries GDP and is calculated in comparison to other countries GDPs that are included in our dataset"),
       h6("Education Ranking is based on the highlighted countries percentage of women 25 and older that have received secondary education. 
          It is calculated in comparison to other countries."),
       h6("Rank is calculated by dividing Education Ranking by the GDP ranking. Rank tells us how high a country's educational attainment rank is given its GDP. 
       It is also calculated in comparison to other countries.")
      
     ),
     mainPanel(
       h2("Ranking Percentage of Educational Attainment for Women based on Country GDP"),
       leafletOutput("gdp_education_map"),
       h4(strong("Data Analysis:")),
       h5("From the interactive map, we are able to see that 4 of the 10 highest ranked countries the continent with the highest rank is Asia followed by Europe and North America. 
          However, we also noticed countries with lower GDP are sometimes ranked higher than countries with higher GDP which indicates that a higher GDP doesn't always correlate with higher educational attainment"),
     )
   )
)
page_three <- tabPanel(
  "Family Planning",
  titlePanel(strong("Does fulfillment of Family Planning impact Maternal Mortality?")),
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectRank_category"),
    h6("Ranking is based off of percentage fulfillment of family planning."),
    h6("maternal_mortality_ratio is calculated by measuring maternal mortality per 10,000 live births.")),
    
    mainPanel(
      h2("Correlation between Fulfillment of Family Planning and Maternal Mortality"),
      plotlyOutput("family_mortality_barchart"),
      h4(strong("Data Analysis:")),
      h5("The top 10 countries with a higher percentage of family planning fulfilled have distinctively lower maternal mortality ratios than the other countries. 
      The 70 countries with a higher percentage of family planning fulfilled have higher fulfilled family planning over the maternal mortality ratio. 
      Unlike the 70 countries, the countries ranked 71 to the bottom (119) have a trend of having a higher maternal mortality ratio over the percentage of fulfilled family planning."),
    )
  )
)
page_four <- tabPanel(
  "Education",
  titlePanel(strong("Does Higher Educational Attainment lead to Lower Fertility?")),
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectContinents"),
      h6("avg_educational_attainment_2016_2021 is the percentage of women 25 and older that have received secondary education"),
      h6("BirthsPerWoman is the average amount of births per woman for the selected Country")
    ),
    mainPanel(
      h2("Correlation between Percentage of Educational Attainment for Women and Fertility Rate"),
      plotlyOutput("fertility_education_scatterplot"),
      h4(strong("Data Analysis:")),
      h5("For South America, Australia, Africa, and North America we see a negative correlation with Education Level and Fertility Rate. 
         However for Europe it is the opposite and we notice a positive correlation. 
         In Asia we see a relatively steady fertility rate given educational attainment."),
    )
  )
)
page_five <- tabPanel(
  "Conclusion",
  titlePanel(strong("Key Takeaways")),
  sidebarLayout(
    sidebarPanel(
      img(src = "/Users/keerthirenduchintala/Documents/info201/project-group-6-section-aa/Womens_Reproductive_Health_Shiny/www/introduction page picture.png", height = 80, width = 70),
    ),
    mainPanel(
      h3(strong("Does a country's GDP impact percentage of education attainment for women?")),
      h4("In general we saw that a country's GDP does correlate with higher educational attainment. 
         However, this cannot be generalized as were instances where low GDP countries had relatively high percentages of educational attainment." ),
      h3(strong("Connection to Womens Health:")),
      h4("The overall rank is an indicator of how much a country prioritizes womens education because the rank shows us how much of the population of women above the age 25 received secondary education given its GDP. 
          It is also known that higher educational attainment is an indicator for healthy maternal health outcomes."),
      h3(strong("How does the fulfillment of family planning impact maternal mortality?")),
      h4("In general we saw that higher rates of fulfillment of family planning reduce maternal mortality"),
      h3(strong("Connection to Womens Health:")),
      h4("From our Data, we are able to determine that a higher percentage of fulfillment of family planning correlats to lower maternal mortality rates.
         This tells us of the importance of the fulfillment of family planning as an indicator of Womens Health. 
         Furthermore, since we noticed that there is a drastic increase in maternal mortality as the fulfillment of family planning reaches lower percentages, we can predit that having a population that has a higher percentage of fulfillment of family planning leads to better health of the population women."),
      h3(strong("How does women’s education level impact their fertility rate (births per woman)?")),
      h4("In general we saw that higher education levels (determined by educational attainment) correlate with lower fertility rates."),
      h3(strong("Connection to Womens Health:")),
      h4("We can predict from our data that in general higher educational attainment results in lower fertility rate.
                This leads us to a further prediction that receiving an adequate education means they are more aware of their reproductive rights. However, very low fertility rates are also an inidicator of an unhealthy population."),
    )
  )
)
ui <- navbarPage(
  theme = bs_theme(version = 5, bootswatch = "minty"),
  img(src = "/Users/keerthirenduchintala/Documents/info201/project-group-6-section-aa/Womens_Reproductive_Health_Shiny/www/introduction page picture.png", height = 80, width = 70),
  page_one,
  page_two,
  page_three, 
  page_four,
  page_five
)

  
 
