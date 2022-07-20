# producing a correlation plot
# example from r

data(SaratogaHouses, package="mosaicData")
SaratogaHouses
traffic <- read.csv("roadTrafficDeaths.csv",header = TRUE)

colnames(cancer_2016_both)
df = subset(cancer_2016_both, select = -c(Period,Indicator,Dim1) )
df
df %>% 
  rename(
    life_expectancy = First.Tooltip)
df1 <-left_join(df,traffic, by="Location")
df2 <-df1 %>%filter(!is.na(df1$First.Tooltip.y))
df3 = subset(df2, select = -c(Period,Indicator) )
df3 %>% 
  rename(
    life_expectancy = First.Tooltip.x, traffic_deaths=First.Tooltip.y)
sanitation_2016 <- subset(sanitation, sanitation$Period=="2016")
sanitation_2016_total <-subset(sanitation_2016, sanitation_2016$Dim1=="Total")
plotdata = subset(sanitation_2016_total, select = -c(Period,Indicator,Dim1) )
plotdata1 <-left_join(df3 ,plotdata, by="Location")
plotdata1 %>% 
  rename(
    life_expectancy = First.Tooltip.x, traffic_deaths=First.Tooltip.y, basic_sanitation=First.Tooltip)
plotdata1
doctors_2016_data=subset(doctors_2016, select=-c(Period, Indicator))
df4 <-left_join(doctors_2016_data,plotdata1, by="Location")
df4
df7 <-df4 %>%filter(!is.na(df4$First.Tooltip.y))

correlation_data <-df7 %>% 
  rename(
    cancer_diagnosis_probability_from_30_70 = First.Tooltip.x, road_traffic_deaths=First.Tooltip.y, basic_sanitation_available=First.Tooltip.x.x, doctors_available_per_10000=First.Tooltip.y.y )

# correlation_data has now been made in the same format as the SaratogaHouses data set
# selecting numeric variables and calculate correlations
 <-dplyr::select_if(correlation_data, is.numeric)
r <- cor(dataset, use="complete.obs")
round(r,2)

library(ggplot2)
library(ggcorrplot)                           
ggcorrplot(r)
ggcorrplot(r, 
           hc.order = TRUE, 
           type = "lower",
           lab = TRUE)

# creating a mosaic plot
library(readr)

# performing chi-square test
malaria <- read.csv("incedenceOfMalaria.csv",header = TRUE)
malaria_argentina <-subset(malaria, malaria$Location=="Argentina")
malaria_india <-subset(malaria, malaria$Location=="India")
malaria_egypt <-subset(malaria, malaria$Location=="Egypt")
malaria_brazil <-subset(malaria, malaria$Location=="Brazil")
newdata <- rbind(malaria_argentina, malaria_brazil, malaria_egypt, malaria_india)
newdata
table <- table(newdata$Location, newdata$Period)
class(table)
table

set.seed(1)
df <- data.frame()