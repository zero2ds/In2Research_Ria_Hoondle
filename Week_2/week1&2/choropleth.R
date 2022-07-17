
malaria

library(ggplot2)
library(tidyverse)
view(malaria)
malaria1 <- subset(malaria, malaria$Period=="2010")
colnames(malaria1)
names(malaria1)[names(malaria1)=='Location'] <-"region"
malaria1
mapdata <-map_data("world")
view(mapdata)
mapdata <-left_join(mapdata,malaria1, by='region')
view(mapdata)
mapdata1 <-mapdata %>%filter(!is.na(mapdata$First.Tooltip))

map1 <-ggplot(mapdata1, aes(x=long, y=lat, group=group)) +
geom_polygon(aes(fill= First.Tooltip), colour="grey") 
map1
map2 <- map1 + scale_fill_gradient(name = "Malaria incedences", low = "yellow", high =  "red", na.value = "grey50")+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        rect = element_blank()) 
map2

population <- read.csv("population10SDG3.8.2.csv",header = TRUE)
population1 <- subset(population, population$Dim1=="Total")
population2 <-subset(population1, population1$Location=="Colombia")
population3 <-subset(population1, population1$Location=="China")
population4 <-subset(population1, population1$Location=="Costa Rica")
population5 <-subset(population1, population1$Location=="Croatia")
population6 <-subset(population1, population1$Location=="Ethiopia")
total <- rbind(population2,population3,population4,population5,population6)

ggplot(total, aes(x=Period, y=First.Tooltip, fill=Location))+
  geom_area() +
  labs(title="Population with health expenditure greater than 10% of income", x="year", y="Population in thousands")






