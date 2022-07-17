life_expectancy <- read.csv("../project/WHOregionLifeExpectancyAtBirth.csv")
life_expectancy
class(life_expectancy)
# useful R commands:
# ls() list all variables in a workspace 
# rm ('a', 'b') remove variables a and b
# rm(list=ls()) remove all variables
# getwd() get current working directory
# setwd('Path') set working directory to path 
# q() quit R
# ?Command show the documentation Command
# ??Keyword search the all packages/functions with 'Keyword', "fuzzy search"

# using variables to store information in R examples
 a <- 4
 a
 a*a
 a_squared <- a*a
 a_squared
 sqrt(a_squared)
 
 # building a vector with c (concatenate) - v <- c() , a vector is like a single coloumn or row in a spreadsheet, multiple vectors can be combined to make a matrix.
 # operations can be performed on vectors : var(v), median(v), sum(v), prod(v+1), length(v)
 # matrix is a 2D vector with rows and coloumns - arrays store data in more than two dimensions
 # install packages 
 
 v <- c(1,2,3,4,5)
 
 mat1 <- matrix(1:360, 5, 72)
 mat1
 print(mat1)
 mat1 <- matrix(1:360, 5, 72, byrow=TRUE)
 mat1
 dim(mat1)
 
 arr1 <- array(1:360, c(5, 72, 2))
 arr1[,,1]
 print(arr1)
 arr1[,,2]
 print(arr1) 
 
 # Using life expectancy data
 
 life_expectancy
 ls(pattern = "life*")
 class(life_expectancy)
 head(life_expectancy)
 str(life_expectancy)
 life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv", header = F)
 head(life_expectancy)
 
 life_expectancy <- as.matrix(read.csv("WHOregionLifeExpectancyAtBirth.csv",header = TRUE))
 
life_expectancy
  class(life_expectancy)
 head(life_expectancy)
 
 air_pollution <- as.matrix(read.csv("airPollutionDeathRate.csv"))
 class(air_pollution)
 
 require(tidyverse)
 tidyverse_packages(include_self = TRUE)
 
 # tibbles are modified data frames that make data exploration more robust
 
 life_expectancy <- tibble::as_tibble(life_expectancy)
 life_expectancy
 class(life_expectancy)
 
 dplyr::glimpse(life_expectancy) #alike str()
 dplyr::filter(life_expectancy, Count>100)
 rlang::last_error()
 dplyr::slice(life_expectancy, 10:15)
 
 MyDF <- read.csv("WHOregionLifeExpectancyAtBirth.csv")
 dim(MyDF)
 str(MyDF)
 head(MyDF)
 
 hist(MyDF$First.Tooltip)
 
 # Using ggplot2 for statistical analysis - ggplot2 only accepts data in data frames
 require(ggplot2)
 library(ggplot2)
 
 life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = FALSE)
 life_expectancy
 life_expectancy1 <- subset(life_expectancy, life_expectancy$V1 == "Africa")

 library(tidyverse)
 library(viridis)
 library(hrbrthemes)
 library(ggplot2)
 library(readr)
 library(ggplot.multistats)
 
 set.seed(3)
 y <- life_expectancy1
 df1 <- data.frame(y)
 df1
 
 life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = FALSE)
 life_expectancy
 life_expectancy1 <- subset(life_expectancy, life_expectancy$V1 == "Africa")
 life_expectancy2 <- subset(life_expectancy, life_expectancy$V1 == "Americas")
 life_expectancy3 <- subset(life_expectancy, life_expectancy$V1 == "South-East Asia")
 life_expectancy4 <- subset(life_expectancy, life_expectancy$V1 == "Europe")
 life_expectancy5 <- subset(life_expectancy, life_expectancy$V1 == "Eastern Medditeranian")
 life_expectancy6 <- subset(life_expectancy, life_expectancy$V1 == "Western Pacific")
 
 
 ggplot(life_expectancy,aes(x=V2, y=V5))+geom_boxplot()

 plot(life_expectancy1$V2, life_expectancy1$V5, xlab="year", ylab='life expectancy (years)', main='Africa')
 Country <- c("Africa", "Americas" , "south-east asia", "Europe", "Eastern medditeranian", "Westernpacific")
 df <- data.frame(Country, life_expectancy1,life_expectancy2,life_expectancy3,life_expectancy4, life_expectancy6)
 plot(life_expectancy1$V2, life_expectancy1$V5, xlab="year", ylab='life expectancy (years)', main='Africa')
 library(ggplot2)
 library(reshape2)

df
ggplot()+
  geom_line(data=life_expectancy1, mapping= aes(x=V2, y=V5), colour="blue")+
geom_point(data=life_expectancy1, mapping= aes(x=V2, y=V5), colour="green")

# plotting a line graph
library(ggplot2)
ggplot(life_expectancy1, aes(x=V2, y=V5, group=1,)) + geom_point() + geom_line(colour="red")+ geom_smooth()+ labs(title="Life expectancy in Africa", x="Year", y="Life expectancy")
theme_minimal()

#plotting slope graph
library(CGPfunctions)

data(gapminder, package="gapminder")
gapminder

life_expectancy

life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = TRUE)
df <- life_expectancy %>%
  

  filter(Period %in% c(2000,2010,2015,2019)) & location %in% c("Africa", "Americas" , "south-east asia", "Europe", "Eastern medditeranian", "Western pacific") %>%

  mutate(Period= factor("Period"), First.Tooltip= round("First.Tooltip")
  

newggslopegraph(df, First.Tooltip, Period, Location) + labs( title="Life Expectancy by Country")

life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = FALSE)
life_expectancya <- subset(life_expectancy, life_expectancy$V4 == "Female")
life_expectancyb <- subset(life_expectancya, life_expectancya$V2 == "2000")
life_expectancyc <- subset(life_expectancya, life_expectancya$V2 == "2010")
life_expectancyd <- subset(life_expectancya, life_expectancya$V2 == "2015")
life_expectancye <- subset(life_expectancya, life_expectancya$V2 == "2019")  

male_life_expectancy <- subset(life_expectancy, life_expectancy$V4 == "Male")
male_life_expectancy_a <- subset(male_life_expectancy, male_life_expectancy$V2 == "2000")
male_life_expectancy_b <- subset(male_life_expectancy, male_life_expectancy$V2 == "2010")
male_life_expectancy_c <- subset(male_life_expectancy, male_life_expectancy$V2 == "2015")
male_life_expectancy_d <- subset(male_life_expectancy, male_life_expectancy$V2 == "2019")

total <- rbind(life_expectancyb, male_life_expectancy_a)
total
ggplot(total, aes(factor("V1"), V5, fill=V4)) + geom_bar(stat="identity", position="dodge") +scale_fill_brewer(palette="Set1")

ggplot(total, aes(fill=V4, y=V5, x=V1)) + geom_bar(position='dodge', stat='identity')+ labs(x= "Country", y="Life Expectancy", title="Global Life Expectancy by Gender")

library(lattice)


life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = TRUE)


life_expectancyf <- subset(life_expectancy,life_expectancy$V2=="2019")

ggplot(life_expectancyf, aes(x=V1,y=V5,colour=V1, shape=V4)) + geom_point() +labs(x="Location", y="Life Expectancy", title="Global Life Expectancy by sex")
rlang::last_error()

library(ggplot2)
class(life_expectancyb)
data(Marriage)
Marriage

life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = TRUE)
ggplot(life_expectancyb, aes(x=V1, y=V5)) + geom_bar(stat='identity', fill="cornflowerblue") + labs(x="Location", y="Life expectancy", title="Female Life Expectancy across the world in 2000")

ggplot(life_expectancy, aes(x=Location, y=First.Tooltip, colour=Period, shape=Dim1)) +geom_point() + labs(x="Location", y="Life expectancy", title="Global Life Expectancy by gender and year")
       
alcohol_abuse <-read.csv("alcoholSubstanceAbuse.csv")
alcohol_abuse
class(alcohol_abuse)

bothsexes_abuse <-subset(alcohol_abuse, alcohol_abuse$Dim1=="Both sexes")
bothsexes_abuse1 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Australia")
bothsexes_abuse2 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Barbados")
bothsexes_abuse3 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Croatia")
bothsexes_abuse4 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Denmark")
bothsexes_abuse5 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Egypt")
bothsexes_abuse6 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="France")
bothsexes_abuse7 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Germany")
bothsexes_abuse8 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Hungary")
bothsexes_abuse9 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="India")
bothsexes_abuse10 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Japan")
bothsexes_abuse11 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Kenya")
bothsexes_abuse12 <-subset(bothsexes_abuse, bothsexes_abuse$Location=="Lithuania")

all_countries <- rbind(bothsexes_abuse1, bothsexes_abuse2,bothsexes_abuse3,bothsexes_abuse4,bothsexes_abuse5,bothsexes_abuse6,bothsexes_abuse7,bothsexes_abuse8,bothsexes_abuse9,bothsexes_abuse10,bothsexes_abuse11,bothsexes_abuse12)

ggplot(all_countries, aes(x=Period, y=First.Tooltip, group=1)) + geom_line(colour="grey") + geom_point(colour="blue") + facet_wrap(~Location) + theme_minimal(base_size = 9) +theme(axis.text.x = element_text(angle=45,hjust = 1)) +labs(x="Year", y="Consumption weekly in Units", title="Average weekly Alcohol Consumption of Men and Women")



