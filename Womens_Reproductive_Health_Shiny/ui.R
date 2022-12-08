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
library(plotly)
library(tidyr) 
library(leaflet)
library(sf)
library(rgdal)
library(tidyverse)
library(ggplot2)
library(shinythemes)

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
    img(src = "introduction%20page%20picture.png", height = 350, width = 275),
    h2(strong("Our Main Question:")),
    h3("What factors and situations give rise to outcomes that are known to impact Womens Reproductive Health?"),
    p("Women's health is an important cornerstone of the health of all people and a prerequisite and foundation for sustainable human development. 
      There are many factors that can lead to maternal related health outcomes, such as a country's GDP, women’s education levels, fulfillment of family planning, and maternal mortality rates. 
      These factors ultimately contribute to not only individual female development, but also to national economic development.And thus, we aim to investigate the relationships between these factors as a indicator of Maternal Health."),
    h3("Problem Domain:"),
    p("The sociotechnical situation in which our topic falls in is framed around the overall health of women throughout the world. The UN writes that \"investing in adolescent girls– especially in their education and reproductive health and rights will ensure sustainable development for all\".
      From this, we are able to see that the human value of women’s rights and education highly correlates with the population health of the country.The International Council on Women’s Health Issues writes, \"The Health of Women and Girls Determines the Health and Well Being of Our Modern World\".
      From this we see that the general public is effected by maternal health outcomes and therefore they are indirect stakeholders. A possible drawback from our project is that no causal claim can be made. As written in the article on causal effects of education on sexual and reproductive health in low and middle-income countries, we must understand that there are many other factors that play into the outcomes we are analyzing. 
      An additional drawback is that women tend to have lower social status than men in most civilizations, which results in unequal power and relationships. Some benefits from this project are due to similar causes. Women are victims of gender inequality and are often ignored from discussions on a countries’ economy. 
      Our project helps put women back into the conversation. We hope that our project will allow for people to see that maternal health is a topic to be discussed."),
    h4("The Questions that we aim to answer through our interactive plots are:"),
    p(strong("Does a country's GDP impact percentage of education attainment for women?")),
    p(strong("How does the fulfillment of family planning impact maternal mortality?")),
    p(strong("How does women's education level impact their fertility rate (births per woman)?")),
    h3("Our dataset:"),
    p("The first dataset is on countries GDP, this data will help us organize the most recent countries GDP. We will be able to mutate the data to compare a country's GDP with women's education levels to answer our research question. The data was collected by the World Bank throughout multiple years. 
      The World Bank collects this data in order to keep track of a country's economic performance. The data collection effort was funded by the World Bank and they are likely to benefit from the data. The data is credible because the World Bank is the international standard for keeping track of economic data. 
      We obtained the data from a search on the World Bank's website."),
    p("The second dataset is on the educational attainment for the population of different countries. This dataset will be beneficial because we will be able to combine this dataset (while filtering for women) to figure out how a country's GDP correlates with a women's educational level. 
    The data was collected by Unicef. The dataset we are using comes from the years 2016 to 2021. Unicef collects this data for their mission. Funding is from voluntary contribution from governments, intergovernmental organizations, the private sector and individuals. These organizations are the ones that are gonna make money. 
    Unicef is the global standard on data regarding women and children's health. We obtained the data from a search on Unicefs website."), 
    p("The third data set is Women’s Reproductive Age. This data will help us know the married or in-union women of reproductive age who have their need for family planning. Then we can compare this data to the level of education of women for our research. 
    The data world health statistics 2020 was collected by the World Health organization who updated it a year ago. This dataset from Kaggle covers the most recent and updated health statistics of the world. The data was funded by Kaggle website the World Health organization and they are more likely to benefit from the data. 
    The data is secure and credible because the world health organization is the United Nations agency and they work to promote health. We obtained the data from a search on the kaggle website and we link to the world health organization."),
    p("The fourth data set is about Maternal Mortality Rates. This data can see Births attended by skilled personnel and help us compare maternal mortality at which ages, and this can be well linked to education levels. The data is collected by the World Health Organization. The purpose is to collect the information of Maternal Mortality Rates. 
    The World Health Organization funded this data, and they are more likely to benefit from the data. The data is validated and held secure because the world health organization is the United Nations agency and their data are standard and secure. We first search on kaggle which is access to the general public and link to the data."),
    p("The fifth dataset shows the yearly fertility rate (births per woman) in each country. This dataset will enable us to answer the research questions by finding the correlations between this dataset and the datasets about a country's GDP, women's education, etc. The data is collected by the World Bank throughout decades of years from 1960 to 2020. 
    It was collected to monitor each country's number of newborn babies every year. The World Bank borrows the money it lends to developing countries for economical improvements. The data is trustworthy since the World Bank databases standards and norms are internationally accepted. We obtained the data from the World Bank website as it is open access to everyone."),
    
    
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
    mainPanel(
      h3(strong("Does a country's GDP impact percentage of education attainment for women?")),
      h5("In general, we saw that a country's GDP does correlate with higher educational attainment. 
         However, this cannot be generalized as there were instances where low GDP countries had relatively high percentages of educational attainment."),
      h4(strong("Connection to Womens Health:")),
      h5("The overall rank from the first graph is an indicator of how much a country prioritizes women's education because the rank shows us how much of the women population above the age 25 received secondary education given its GDP. 
          It is also known that higher educational attainment is an indicator for healthy maternal health outcomes."),
      h3(strong("How does the fulfillment of family planning impact maternal mortality?")),
      h5("In general, we saw that higher rates of fulfillment of family planning reduce maternal mortality."),
      h4(strong("Connection to Womens Health:")),
      h5("From our Data, we are able to determine that a higher percentage of fulfillment of family planning correlats to lower maternal mortality rates.
         This tells us of the importance of the fulfillment of family planning as an indicator of Women's Health. 
         Furthermore, since we noticed that there is a drastic increase in maternal mortality as the fulfillment of family planning reaches lower percentages, 
         we can predict that having more population with a higher percentage of fulfillment of family planning leads to better health of women."),
      h3(strong("How does women’s education level impact their fertility rate (births per woman)?")),
      h5("In general, we saw that higher education levels (determined by educational attainment) correlate with lower fertility rates."),
      h4(strong("Connection to Womens Health:")),
      h5("From the third graph, we can predict that higher educational attainment generally results in lower fertility rate. 
         This leads us to a further prediction that receiving an adequate education means they are more aware of their reproductive rights. 
         However, very low fertility rates are also an inidicator of an unhealthy population of the countries.")
    )
)

page_six <- tabPanel(
  "Report",
  titlePanel(strong("Report")),
  mainPanel(h3(strong("Code name:")),
            h4("Women’s Health"),
            h3(strong("Project title:")),
            h4("Women’s Health and Factors that lead to Certain Outcomes"),
            h3(strong("Authors:")),
            h4("Eunji Shin (eunjiii@uw.edu), Keerthi Renduchintala (krendu@uw.edu), Lexi He (hze123@uw.edu)"),
            h3(strong("Affiliation:")),
            h4("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
            h3(strong("Date:")),
            h4("Autumn 2022"),
            h3(strong("Abstract:")),
            h4("Our main question is to find out if there is a connection between a country's wealth, women's education, fertility rates, family planning, and maternal mortality rates.
               This question is important because our group believes there is a high correlation between a country's GDP and women's education, women's education and maternal age, and family planning and maternal mortality rates.
               To address the question, our group will collect the datasets regarding the main question and find the correlations in between."),
            h3(strong("Keywords:")),
            h4("Reproductive education accessibility; Women’s education; Country GDP (income)"),
            h3(strong("Introduction:")),
            h4("Women's health is an important cornerstone of the health of all people and a prerequisite and foundation for sustainable human development.
            It is easy to see that the problem of female abortion is still very serious, and it is a serious social problem all over the world.
            There are many factors that can lead to maternal related health outcomes, such as the country's GDP, income, women’s education level, etc.
            Whether it's less fallout from abortion or less time off work for sick leave that can help women participate in the abortion process, the reduction in abortion rates has many benefits for women themselves.
            leave that can help women participate in the labor market, career choices, and advancement. By reducing the rate of abortion through lower fertility rates, fewer families fall below the poverty level through fewer children in a given family.
            Increases in education and income can increase financial resources. This can ultimately contribute to not only individual female development, but also to national economic development. So we wanted to investigate the relationship between these factors and maternal health."),
            h3(strong("Problem Domain:")),
            h4("The sociotechnical situation in which our topic falls in is framed around the overall health of women throughout the world. The UN writes that “investing in adolescent girls– especially in their education and reproductive health and rights – will ensure sustainable development for all”.
               From this, we are able to see that the human value of women’s rights and education highly correlates with the reproductive age of the country. Some of the direct stakeholders for the project are the adolescent girls that were unable to attain education due to family and/or financial burdens.
               Another group of direct stakeholders is the women in said countries. These women are the data points in the datasets we are using and so they are the ones most affected by the project. Furthermore, an additional group of direct stakeholders is the policymakers that could use the analysis being done to create and adjust policies that affect the health of women all over the world.
               In addition to all these direct stakeholders, there are a handful of indirect stakeholders that will be affected by our project. One group of indirect stakeholders is the families that the women come from. These families will be impacted by any policy change that results from the data.
               Another group of indirect stakeholders are the general public. The International Council on Women’s Health Issues writes, “The Health of Women and Girls Determines the Health and Well-Being of Our Modern World”. From this we see that the general public is effected by maternal health outcomes and therefore they are indirect stakeholders.
               A possible drawback from our project is that no causal claim can be made. As written in the article on causal effects of education on sexual and reproductive health in low and middle-income countries, we must understand that there are many other factors that play into the outcomes we are analyzing.
               An additional drawback is that women tend to have lower social status than men in most civilizations, which results in unequal power and relationships. Because of this, women are more vulnerable than men to violations of their human rights, such as sexual assault. Some benefits from this project are due to similar causes.
               Women are victims of gender inequality and are often ignored from discussions on a countries’ economy. Our project helps put women back into the conversation. We hope that our project will allow for people to see that maternal health is a topic to be discussed. From the project results, people will gradually realize the importance of maternal health.
               Then the policy makers will make feasible policies to protect and support women."),
            h4("https://www.un.org/youthenvoy/2016/03/education-reproductive-health-girls-key-sustainable-development/ https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6582211/ https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3703826"),
            h3(strong("Research Questions:")),
            h4(strong("Does a country's GDP impact women’s education?")),
            h4("We want to assess the correlation between how a country’s GDP can affect women’s education. Since we believe women's education is highly affected by a country’s GDP in such situations like a family is shorthanded for their farms, etc. This correlation will allow us to find reasons for lowered women’s education levels."),
            h4(strong("How does the fulfillment of family planning impact maternal mortality?")),
            h4("We want to assess how the percentage of women who have received family planning corresponds to mortality rates. We believe this is an important assessment to make because it will tell us a correlation that will help us answer the question of what factors lead to poor reproductive health.
               There is a high likelihood that lower percentages of women receiving family planning will result in higher maternal mortality, but we want to make sure of this through the data. We can also measure the extent to which it occurs. We can use the data to see the extent to which family planning matters in lowering maternal mortality rates."),
            h4(strong("How does women’s education level impact their maternal age?")),
            h4("A woman's level of education is closely related to her knowledge of contraception, such as contraceptive pills and devices. And there are differences in abortion rates by the women’s education level. So we hope to find the relationship between women's education and usage of contraception through the research."),
            h3(strong("The Dataset:")),
            h4("The first dataset is on countries GDP, this data will help us organize the most recent countries GDP. We will be able to mutate the data to compare a country's GDP with women's education levels to answer our research question. The data was collected by the World Bank throughout multiple years.
               The World Bank collects this data in order to keep track of a country's economic performance. The data collection effort was funded by the World Bank and they are likely to benefit from the data. The data is credible because the World Bank is the international standard for keeping track of economic data. We obtained the data from a search on the World Bank's website."),
            h4("The second dataset is on the educational attainment for the population of different countries. This dataset will be beneficial because we will be able to combine this dataset (while filtering for women) to figure out how a country's GDP correlates with a women's educational level. The data was collected by Unicef. The dataset we are using comes from the years 2016 to 2021.
               Unicef collects this data for their mission. Funding is from voluntary contribution from governments, intergovernmental organizations, the private sector and individuals. These organizations are the ones that are gonna make money. Unicef is the global standard on data regarding women and children's health. We obtained the data from a search on Unicefs website."),
            h4("The third data set is Women’s Reproductive Age. This data will help us know the married or in-union women of reproductive age who have their need for family planning. Then we can compare this data to the level of education of women for our research. The data world health statistics 2020 was collected by the World Health organization who updated it a year ago.
               This dataset from Kaggle covers the most recent and updated health statistics of the world. The data was funded by Kaggle website the World Health organization and they are more likely to benefit from the data. The data is secure and credible because the world health organization is the United Nations agency and they work to promote health. We obtained the data from a search on the kaggle website and we link to the world health organization."),
            h4("The fourth data set is about Maternal Mortality Rates. This data can see Births attended by skilled personnel and help us compare maternal mortality at which ages, and this can be well linked to education levels. The data is collected by the World Health Organization. The purpose is to collect the information of Maternal Mortality Rates.
               The World Health Organization funded this data, and they are more likely to benefit from the data. The data is validated and held secure because the world health organization is the United Nations agency and their data are standard and secure. We first search on kaggle which is access to the general public and link to the data."),
            h4("The fifth dataset shows the yearly fertility rate (births per woman) in each country. This dataset will enable us to answer the research questions by finding the correlations between this dataset and the datasets about a country's GDP, women's education, etc. The data is collected by the World Bank throughout decades of years from 1960 to 2020.
               It was collected to monitor each country's number of newborn babies every year. The World Bank borrows the money it lends to developing countries for economical improvements. The data is trustworthy since the World Bank databases' standards and norms are internationally accepted. We obtained the data from the World Bank website as it is open access to everyone."),
            h3(strong("Findings:")),
            h4("Does a country's GDP impact percentage of education attainment for women?"),
            h5("In general, we saw that a country's GDP does correlate with higher educational attainment.
               However, this cannot be generalized as were instances where low GDP countries had relatively high percentages of educational attainment."),
            h4("How does the fulfillment of family planning impact maternal mortality?"),
            h5("In general, we saw that higher rates of fulfillment of family planning reduce maternal mortality."),
            h4("How does women’s education level impact their fertility rate (births per woman)?"),
            h5("In general we saw that higher education levels (determined by educational attainment) correlate with lower fertility rates."),
            h3(strong("Discussion:")),
            h4("From our project, we discovered that a higher country GDP leads to higher education attainment of women, a higher fulfillment of family planning leads to lower maternal mortality, and a higher women's education attainment leads to a lower fertility rate. 
            These findings are important to note because it indicates that many factors can affect the fertility rate as well as women's health. Women's health is crucial because it is highly related to the fertility rate. The fertility rate is one of the aspects to analyze the well-being of a country since low fertility reduces the population size of the younger generation and eventually leads to the decline of the overall population. 
            The reduction in the country's population will have negative implications for economic productivity and per capita income growth. Therefore, it is necessary to recognize what factors affect women's health for the well-being of countries. The primary factors we discovered from our project were the country's GDP, women's educational attainment, and the fulfillment of family planning. 
            The scatterplot that analyzed the correlation between Women's educational attainment and the Fertility rate based on the European continent revealed that higher educational attainment leads to a higher fertility rate, despite the overall result based on all countries revealing that higher educational attainment leads to a lower fertility rate. 
            However, since the countries on the European continent have higher women's educational attainment based on the Country's GDP compared to other countries, this indicates how a higher Country's GDP eventually leads to a higher fertility rate if they have advanced systems of gender equality. Thus, from this project, we can learn how a higher fertility rate does not necessarily come from a higher Country's GDP nor a higher women's educational attainment but the advanced systems of gender equality. 
            Therefore, countries all around the world should implement advanced systems of gender equality for the country's overall well-being"),
            h3(strong("Conclusion:")),
            h4("From our project and through our key takeaways we are able to understand the relationship between the health indicators of GDP, Education Levels, Maternal Mortality, and Fertility rates, and Family Planning. Through the correlations between these indicators we were able to assess what indicators lead to what maternal health outcomes.
               We saw that in general higher GDP countries have higher Educational Attainment, we also saw that Higher rates of completion of family planning correlate with lower maternal mortality. Finally we saw that higher education levels correlate with lower fertility rates. From the extend of the correlations we can highlight the importance of certain indicators.
               We understand that having a high level of the population succesfully complete family planning drastically impacts maternal mortality. From our Data, we are able to determine that a higher percentage of fulfillment of family planning correlates to lower maternal mortality rates. This tells us of the importance of the fulfillment of family planning as an indicator of Womens Health.
               Furthermore, since we noticed that there is a drastic increase in maternal mortality as the fulfillment of family planning reaches lower percentages, we can predit that having a population that has a higher percentage of fulfillment of family planning leads to better health of the population women.
               The other indicators of GDP was also important because it helped us see how educated the women are given that countries GDP. Our statistic of overall rank can be used to understand the how much a country prioritizes womens education as the rank shows us how much of the population of women above the age 25 received secondary education given its GDP.
               It is also known that higher educational attainment is an indicator for healthy maternal health outcomes. Furthermore we were able to see that those high education levels result in low fertility rates. We can predict from our data that in general higher educational attainment results in lower fertility rate.
               This leads us to a further prediction that receiving an adequate education means the females within the population are more aware of their reproductive rights. However, very low fertility rates are also an inidicator of an unhealthy population.In conclusion we were able to determine the correlations between the indicators of maternal health.
               We can extend this further because these correlations help us understand the health of the population."),
            h3(strong("Acknowledgements:")),
            h4("We would like to thank the National Library of Medicine, the national center for biotechnology information."),
            h3(strong("References:")),
            h4("“Data Warehouse.” UNICEF DATA, 29 Mar. 2021, https://data.unicef.org/resources/data_explorer/unicef_f/?ag=UNICEF&df=GLOBAL_DATAFLOW&ver=1.0&dq=.GN_ED_ATTN.F.&startPeriod=2016&endPeriod=2022."),
            h4("Davidson, Patricia M, et al. “The Health of Women and Girls Determines the Health and Well-Being of Our Modern World: A White Paper from the International Council on Women's Health Issues.” Health Care for Women International, U.S. National Library of Medicine, Oct. 2011, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3703826/."),
            h4("“Education and Reproductive Health for Girls Key to Sustainable Development.” United Nations, United Nations, https://www.un.org/youthenvoy/2016/03/education-reproductive-health-girls-key-sustainable-development/."),
            h4("“GDP (Current US$).” Data, https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?end=2020&start=2020."),
            h4("Psaki, Stephanie R, et al. “Causal Effects of Education on Sexual and Reproductive Health in Low and Middle-Income Countries: A Systematic Review and Meta-Analysis.” SSM - Population Health, Elsevier, 20 May 2019, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6582211/."),
            h4("Zeus. “World Health Statistics 2020: Complete: Geo-Analysis.” Kaggle, 2 June 2021, https://www.kaggle.com/datasets/utkarshxy/who-worldhealth-statistics-2020-complete?select=reproductiveAgeWomen.csv."),
            h4("“Fertility Rate, Total (Births per Woman).” Data, https://data.worldbank.org/indicator/SP.DYN.TFRT.IN"),
            h3(strong("Appendix A: Questions")),
            h4("No questions."),
  )
)

ui <- navbarPage(
  "Womens Health",
  page_one,
  page_two,
  page_three, 
  page_four,
  page_five,
  page_six
)

shinyUI(fluidPage(
  theme = shinytheme("flatly"),
  ui
))
  
 
