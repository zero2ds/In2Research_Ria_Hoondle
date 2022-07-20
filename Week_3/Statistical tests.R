# performing statistical tests using R 

# one sample t-Test - parametric test - compares the mean of your sampled data to a known value e.g,comparing a sample mean to population mean - used for small population size
# parametric tests assume a normal distribution of values - bell shaped curve where as a non parametric test is distribution free and is used for non-Normal variables, parametric tests use fixed parameters

cancer <- read.csv("30-70cancerChdEtc.csv",header = TRUE)
life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = TRUE)

cancer_2010 <- subset(cancer, cancer$Period=="2010")
cancer_2010_both <-subset(cancer_2010, cancer_2010$Dim1=="Both sexes")
cancer_2000 <- subset(cancer, cancer$Period=="2000")
cancer_2000_both <-subset(cancer_2000, cancer_2000$Dim1=="Both sexes")
cancer_2005 <- subset(cancer, cancer$Period=="2005")

cancer_2005_both <-subset(cancer_2005, cancer_2005$Dim1=="Both sexes")

cancer_2015 <- subset(cancer, cancer$Period=="2015")
cancer_2015_both <-subset(cancer_2015, cancer_2015$Dim1=="Both sexes")
cancer_2016 <- subset(cancer, cancer$Period=="2016")
cancer_2016_both <-subset(cancer_2016, cancer_2016$Dim1=="Both sexes")

cancer_2000_both$First.Tooltip <-as.numeric(as.character(cancer_2000_both$First.Tooltip))
cancer_2005_both$First.Tooltip <-as.numeric(as.character(cancer_2005_both$First.Tooltip))
cancer_2010_both$First.Tooltip <-as.numeric(as.character(cancer_2010_both$First.Tooltip))

cancer_2015_both$First.Tooltip <-as.numeric(as.character(cancer_2015_both$First.Tooltip))
cancer_2016_both$First.Tooltip <-as.numeric(as.character(cancer_2016_both$First.Tooltip))

first = cancer_2000_both[["First.Tooltip"]]
second = cancer_2005_both[["First.Tooltip"]]
third= cancer_2010_both[["First.Tooltip"]]
fourth=cancer_2015_both[["First.Tooltip"]]
fifth=cancer_2016_both[["First.Tooltip"]]

boxplotdata <-rbind(first, second, third, fourth,fifth)

newdata <-t(boxplotdata)
boxplot(newdata, las=2, names=c("2000","2005", "2010","2015", "2016"), xlab="Year", ylab="% probability of being diagnosed with cancer from age 30-70", main= " Global Percentage probability of being diagnosed with cancer from ages 30-70")

class("First.Tooltip")
sapply(cancer_2010_both,class)


boxplot(First.Tooltip~Period, cancer_2010_both) 

# Ho (null hypothesis) mu in 2010 < 25
# one-sided 95% confidence interval for mu
Test1 <- t.test(third, mu=25, alternative="less", conf.level=0.95)

#two-sided
Test2 <- t.test(third, mu=25, alternative="two.sided", conf.level=0.95)

# creating a grouped box plot
life_expectancy_female <-subset(life_expectancy, life_expectancy$Dim1=="Female")
life_expectancy_male <-subset(life_expectancy, life_expectancy$Dim1=="Male")
plotdata <- rbind(life_expectancy_female, life_expectancy_male)

library(ggplot2)

df=subset(plotdata, select=-c(Period,Indicator))

plotdata
ggplot(plotdata,
       aes(x = Location, y = First.Tooltip, fill=Dim1)) +
  geom_boxplot() +   labs(y="Life expectancy",title = "Global life expectancy from 2000-2019") + geom_jitter(alpha = 0.5, 
                                                                                                            width=.2) 

# one sample t-test Ho mu in Africa = 60, Ha does not equal 60 therefore two tailed test/two sided
plotdata_africa <- subset(plotdata, plotdata$Location=="Africa")
plotdata_asia <- subset(plotdata, plotdata$Location=="South-East Asia")


colnames(plotdata_africa)<- c("one","two","three", "four","five")
plotdata_africa
vec1 <- plotdata_africa$First.Tooltip
vec1
vec2 <-plotdata_asia$First.Tooltip
vec2
t.test(vec1, mu=40)
t.test(vec1,vec2)

sanitation <- read.csv("atLeastBasicSanitizationServices.csv",header = TRUE)
sanitation_2017 <-subset(sanitation, sanitation$Period=="2017")
sanitisation_2017_total <-subset(sanitation_2017, sanitation_2017$Dim1=="Total")
sanitisation_2017_austria <-subset(sanitation_2017, sanitation_2017$Location=="Austria")
sanitisation_2017_peru <-subset(sanitation_2017, sanitation_2017$Location=="Peru")
sanitisation_2017_turkey <-subset(sanitation_2017, sanitation_2017$Location=="Turkey")
sanitisation_2017_canada <-subset(sanitation_2017, sanitation_2017$Location=="Canada")
sanitisation_2017_mali <-subset(sanitation_2017, sanitation_2017$Location=="Mali")
sanitisation_2017_yemen <-subset(sanitation_2017, sanitation_2017$Location=="Yemen")

total <- rbind(sanitisation_2017_austria, sanitisation_2017_canada, sanitisation_2017_mali, sanitisation_2017_peru, sanitisation_2017_turkey, sanitisation_2017_yemen)
library(scales)

ggplot(total, aes(x=First.Tooltip)) +
  geom_histogram(fill="cornflowerblue", colour="white", binwidth=5) + labs(title="Percentage of global population with basic sanitation services", subtitle="2017", x="Percentage") + facet_wrap(~Location) 
vec5 <-sanitisation_2017_austria$First.Tooltip
vec6 <-sanitisation_2017_canada$First.Tooltip
vec7 <-sanitisation_2017_mali$First.Tooltip
vec8 <-sanitisation_2017_peru$First.Tooltip
vec9 <-sanitisation_2017_turkey$First.Tooltip
vec10<-sanitisation_2017_yemen$First.Tooltip


library(moments)
sanitisation_2017_total$First.Tooltip <-as.numeric(as.character(sanitisation_2017_total$First.Tooltip))m 
skewness(sanitisation_2017_total)
vec3 <- sanitisation_2017_total$First.Tooltip
vec3
skewness(vec3)
kurtosis(vec3)

jarque.test(vec3)

ggplot(sanitisation_2017_total, aes(x=First.Tooltip)) +
  geom_density(fill="indianred3") +
  labs(title="Percentage of global population with basic sanitation services", subtitle="2017", x="Percentage")

# correlation graphs 
library(tidyverse)

doctors <- read.csv("medicalDoctors.csv",header = TRUE)
malaria <- read.csv("incedenceOfMalaria.csv",header = TRUE)

doctors_2016 <-subset(doctors, doctors$Period=="2016")
malaria_2016 <-subset(malaria, malaria$Period=="2016")

plotdata <-left_join(doctors_2016,malaria_2016, by='Location')
plotdata1 <-plotdata%>%filter(!is.na(plotdata$First.Tooltip.y))
plotdata1 %>%
  rename("Doctors"="First.Tooltip.x", "Malaria_incedences"="First.Tooltip.y")

cor.test(plotdata1$First.Tooltip.x, 
        plotdata1$First.Tooltip.y)

cancer <- read.csv("30-70cancerChdEtc.csv",header = TRUE)
cancer_2016 <-subset(cancer, cancer$Period=="2016")
cancer_2016_both <-subset(cancer_2016, cancer_2016$Dim1=="Both sexes")
doctor_cancer <-left_join(doctors_2016,cancer_2016_both, by='Location')

vec11 <- doctor_cancer$First.Tooltip.x
vec12 <-doctor_cancer$First.Tooltip.y

graph1 = ggplot(doctor_cancer,
                aes(x=vec11, 
                    y=vec12, colour=Location))+ geom_point(size=5)+labs(x="Doctors per 10000", y="Percentage probability of cancer diagnosis between ages 30-70", title="Correlation between doctors available and cancer cases in 2016")+
  geom_smooth(method = "lm")
graph1 + theme(legend.position = "none")


cor.test(doctor_cancer$First.Tooltip.x, 
         doctor_cancer$First.Tooltip.y)

