# Ria's Week 1 & 2 progress
![e1a5bf00-0b9e-4b81-b3cc-cf996f9537b9](https://user-images.githubusercontent.com/78815761/179416540-06a8e2d6-3db3-47ea-84c0-3956716938d5.png)

This week I explored the ggplot2 package allowing me to create bar charts, scatter diagrams and choropleth maps, after creating the graph I was able to demonstrate statistics provided by the World health Organisation on incedences of Malaria in 2020. I was able to do this by exploring data already provided within R on longitudes and lattitudes of all countries and then by using the left_join() function to combine my data set on Malaria with this data frame accordingly. I was then able to use the scale_fill_gradient() function in order to clearly highlight countries with the greatest number of incidences. In general I have found subsetting data tables and editing them using the left_join and rbind() functions very useful. Installing the packages tidyverse and reshape2 also helped in this process.
<img width="567" alt="Screen Shot 2022-07-17 at 18 14 12" src="https://user-images.githubusercontent.com/78815761/179417065-8fbbd903-a620-408d-a15b-dd181870bc43.png">

Combining data frames and subsetting data tables was efficient in allowing me to create grouped barplots as shown above to represent the differences in life expectancy between males and females across the globe in the year of 2010
<img width="608" alt="Screen Shot 2022-07-17 at 18 13 09" src="https://user-images.githubusercontent.com/78815761/179417198-a26b7809-0416-455b-8c66-1cfdb6086771.png">

Exploring the facet-grid() function made it much easier to consolidate all the data from one csv. file in one graph as I was dealing with 3 different dependant variables of Location, Gender and Time period.
