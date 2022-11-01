# Instructions for P01: Project Proposal

* **Where is the project brief?**  [`../instructions/project-design-brief.pdf`](../instructions/project-design-brief.pdf).
* **Making Progress**: We understand this project might be difficult. Also, we understand that your project ideas might not be completely worked out. So, we ask that you do the best you can. You will receive specific guidance from your TA and constructive feedback. We are confident that you will succeed!
* **What should be included in the proposal?** Every proposal will be different. It depends on your particular project.  That said, in the table below you will find the **required** report elements.  It is important that you engage with and respond to the the Design Brief.
* **How should the proposal be formatted?** You should format your proposal using Markdown. You should aim for a professional presentation - clear, concise, inclusive, interesting, and free of spelling and grammatical errors.
* **What headings should we use?** As needed, the suggested headings below can be revised and new headings and sub-headings can be added. Please use headings, bullet lists, tables, figures, and other markdown code effectively - seek a professional presentation.
* **Questions?** If you have questions, please ask your TA or post on Teams.

|Element | Brief Description|
|---------------| --------------

|Code name | Women’s Health |

|Project title| Women’s Health and Factors that ead to Certain Outcomes |

|Authors | Eunji Shin, eunjiii@uw.edu Keerthi Renduchintala, krendu@uw.edu Lexi He, hze123@uw.edu |

|Affiliation |  INFO-201: Technical Foundations of Informatics - The Information School - University of Washington |

|Date | Autumn 2022|

|Abstract | Our main question is to find out if there is a connection between a country's wealth, women's education, maternal age, family planning, and maternal mortality rates. This question is important because our group believes there is a high correlation between a country's GDP and women's education, women's education and maternal age, and family planning and maternal mortality rates. To address the question, our group will collect the datasets regarding the main question and find the correlations in between. |

|Keywords | Keywords: reproductive education accessibility; women’s education; country GDP (income) |

|Introduction | Women's health is an important cornerstone of the health of all people and a prerequisite and foundation for sustainable human development. It is easy to see that the problem of female abortion is still very serious, and it is a serious social problem all over the world. There are many factors that can lead to maternal related health outcomes, such as the country's GDP, income, women’s education level, etc. Whether it's less fallout from abortion or less time off work for sick leave that can help women participate in the abortion process, the reduction in abortion rates has many benefits for women themselves. leave that can help women participate in the labor market, career choices, and advancement. By reducing the rate of abortion through lower fertility rates, fewer families fall below the poverty level through fewer children in a given family. Increases in education and income can increase financial resources. This can ultimately contribute to not only individual female development, but also to national economic development. So we wanted to investigate the relationship between these factors and maternal health. |

|Problem Domain | Use short sub-sections to describe your topic and the setting (that is, the sociotechnical situation), including project framing, human values, direct and indirect stakeholders, possible harms and benefits. See the Design Brief, section B.3. **Note**: You *must* include three citations to related work (URLs to similar work, high quality articles from the popular press, reseach papers, etc. ). You may find it helpful to include a figure.  (About 400 words.) |

|Research Questions | How does a country's GDP impact women’s education?
We want to assess the correlation between how a country’s GDP can affect women’s education. Since we believe women's education is highly affected by a country’s GDP in such situations like a family is shorthanded for their farms, etc. This correlation will allow us to find reasons for lowered women’s education levels.
How does the fulfillment of family planning impact maternal mortality?
We want to assess how the percentage of women who have received family planning corresponds to mortality rates. We believe this is an important assessment to make because it will tell us a correlation that will help us answer the question of what factors lead to poor reproductive health. There is a high likelihood that lower percentages of women receiving family planning will result in higher maternal mortality, but we want to make sure of this through the data. We can also measure the extent to which it occurs. We can use the data to see the extent to which family planning matters in lowering maternal mortality rates.
How does women’s education level impact their maternal age?
A woman's level of education is closely related to her knowledge of contraception, such as contraceptive pills and devices. And there are differences in abortion rates by the women’s education level. So we hope to find the relationship between women's education and usage of contraception through the research.|

|                                Name                                | number of observ | number of variables |
| ------------------------------------------------------------------ | ---------------- | ------------------- |
|                         GDP(current $)                             |        270       |           66        |
| ------------------------------------------------------------------ | ---------------- | ------------------- |
| Educational attainment of the population (aged 25 years and older) |        100       |           6         |
| ------------------------------------------------------------------ | ---------------- | ------------------- |
|                    Women’s Reproductive Age                        |        119       |           4         |
| ------------------------------------------------------------------ | ---------------- | ------------------- |
|                    Maternal Mortality Rates                        |        184       |           4         |                   
| ------------------------------------------------------------------ | ---------------- | ------------------- |
|                 Fertility Rate (births per woman)                  |        266       |           8         |

The first dataset is on countries GDP, this data will help us organize the most recent countries GDP. We will be able to mutate the data to compare a country's GDP with women's education levels to answer our research question. The data was collected by the World Bank throughout multiple years. The World Bank collects this data in order to keep track of a country's economic performance. The data collection effort was funded by the World Bank and they are likely to benefit from the data. The data is credible because the World Bank is the international standard for keeping track of economic data. We obtained the data from a search on the World Bank's website.

The second dataset is on the educational attainment for the population of different countries. This dataset will be beneficial because we will be able to combine this dataset (while filtering for women) to figure out how a country's GDP correlates with a women's educational level. The data was collected by Unicef. The dataset we are using comes from the years 2016 to 2021. Unicef collects this data for their mission. Funding is from voluntary contribution from governments, intergovernmental organizations, the private sector and individuals. These organizations are the ones that are gonna make money. Unicef is the global standard on data regarding women and children's health. We obtained the data from a search on Unicefs website.

The third data set is Women’s Reproductive Age. This data will help us know the married or in-union women of reproductive age who have their need for family planning. Then we can compare this data to the level of education of women for our research. The data world health statistics 2020 was collected by the World Health organization who updated it a year ago. This dataset from Kaggle covers the most recent and updated health statistics of the world. The data was funded by Kaggle website the World Health organization and they are more likely to benefit from the data. The data is secure and credible because the world health organization is the United Nations agency and they work to promote health. We obtained the data from a search on the kaggle website and we link to the world health organization.

The fourth data set is about Maternal Mortality Rates. This data can see Births attended by skilled personnel and help us compare maternal mortality at which ages, and this can be well linked to education levels. The data is collected by the World Health Organization. The purpose is to collect the information of Maternal Mortality Rates. The World Health Organization funded this data, and they are more likely to benefit from the data. The data is validated and held secure because the world health organization is the United Nations agency and their data are standard and secure. We first search on kaggle which is access to the general public and link to the data.

The fifth dataset shows the yearly fertility rate (births per woman) in each country. This dataset will enable us to answer the research questions by finding the correlations between this dataset and the datasets about a country's GDP, women's education, etc. The data is collected by the World Bank throughout decades of years from 1960 to 2020. It was collected to monitor each country's number of newborn babies every year. The World Bank borrows the money it lends to developing countries for economical improvements. The data is trustworthy since the World Bank databases' standards and norms are internationally accepted. We obtained the data from the World Bank website as it is open access to everyone.|

|Expected Implications |
The possible implications are that we can understand correlations between different factors that eventually lead to poor women’s health. Since women’s health is often an indicator of the health of a population, we hope that policymakers can address the largest causes of decreased women’s health. Policymakers will have the opportunity to make policy changes that allow for more women to receive an education and will also create policies to fund maternal health. Some other possible implications are that technologists can use the datasets and visualizations produced to further delve into finding correlations on a deeper level. These correlations can be used to find root causes and create infrastructures and policies that will combat these root causes. Lastly, designers could make feasible maternal-related educational resources that could be provided to women all over the world to teach them about unexpected circumstances in regard to their health and what to do in such circumstances. |

|Limitations | By using the datasets we gathered, we can find the correlations between a country's GDP and women's education, the need for family planning and maternal mortality rates, and women's education and maternal age. However, there could be a confounding variable, an unmeasured variable that influences both variables. The confounding variable could mislead the results as the variables have high correlations when it's the confounding variable that has correlations in between. Some other limitations are the causal links we can make. Since there are many other factors that influence the data, we cannot make any causal statements. We can only make statements on correlations or patterns. Furthermore, another limitation is that some of the data comes from older data and we are unable to make any assumptions about current data. Also due to some lacking data there are countries in the world that we will not be able to include in our project. This furthermore limits our ability to make assumptions.  |

|_Findings_ | _Not for the project proposal; for final report only. Give answers to each of your research questions. (About 400 words.)_ |

|_Discussion_ | _Not for the project proposal; for final report only. Discuss importance and/or implications of your findings  (About 400 words.)_ |

|_Conclusion_ | _Not for the project proposal; for final report only. Give the reader a summary point, the key point that you will like your audience to leave with. (About 400 words.)_ |

|Acknowledgements | We would like to thank the National Library of Medicine, the national center for biotechnology information. |

|References | “Data Warehouse.” UNICEF DATA, 29 Mar. 2021, https://data.unicef.org/resources/data_explorer/unicef_f/?ag=UNICEF&df=GLOBAL_DATAFLOW&ver=1.0&dq=.GN_ED_ATTN.F.&startPeriod=2016&endPeriod=2022.
Davidson, Patricia M, et al. “The Health of Women and Girls Determines the Health and Well-Being of Our Modern World: A White Paper from the International Council on Women's Health Issues.” Health Care for Women International, U.S. National Library of Medicine, Oct. 2011, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3703826/.
“Education and Reproductive Health for Girls Key to Sustainable Development.” United Nations, United Nations, https://www.un.org/youthenvoy/2016/03/education-reproductive-health-girls-key-sustainable-development/.
“GDP (Current US$).” Data, https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?end=2020&start=2020.
Psaki, Stephanie R, et al. “Causal Effects of Education on Sexual and Reproductive Health in Low and Middle-Income Countries: A Systematic Review and Meta-Analysis.” SSM - Population Health, Elsevier, 20 May 2019, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6582211/.
Zeus. “World Health Statistics 2020: Complete: Geo-Analysis.” Kaggle, 2 June 2021, https://www.kaggle.com/datasets/utkarshxy/who-worldhealth-statistics-2020-complete?select=reproductiveAgeWomen.csv.
“Fertility Rate, Total (Births per Woman).” Data, https://data.worldbank.org/indicator/SP.DYN.TFRT.IN |

|Appendix A: Questions| Do you have questions for your TA or instructor?  Include them here.|
