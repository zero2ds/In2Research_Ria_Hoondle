#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

#Installing Packages
pacman::p_load(
  rio,          # file import/export
  here,         # relative filepaths 
  lubridate,    # working with dates/epiweeks
  aweek,        # alternative package for working with dates/epiweeks
  incidence2,   # epicurves of linelist data
  i2extras,     # supplement to incidence2
  stringr,      # search and manipulate character strings
  forcats,      # working with factors
  RColorBrewer, # Color palettes from colorbrewer2.org
  tidyverse     # data management + ggplot2 graphics
) 

library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
library(maps)
library(mapproj)
library(choroplethr)
library(choroplethrMaps)
library(mapdata)
library(ggplot2)
library(tidyverse)
library(leaflet)
library(plotly)
library(outbreaks)
library(ISOweek)
library(timeDate)

# Looking and creating potential graphs for Shiny App
# Bubble chart
p <- data %>%
  ggplot( aes(doctors_per_10000, NTDs, size = Nursing_per_10000, color=region)) +
  geom_point() +
  ylim(0,74)+
  xlim(0,50)+
  theme_bw()
ggplotly(p)

#Reading data
week7 <- read.csv("week7.csv",header = TRUE)
life_expectancy <- read.csv("WHOregionLifeExpectancyAtBirth.csv",header = TRUE)
birth <- read.csv("adolescentBirthRate.csv",header = TRUE)
birth <-birth %>% 
  rename(year = Period,
         rate_per_1000 = First.Tooltip)
tropical <- read.csv("interventionAgianstNTDs.csv",header = TRUE)
tropical <-tropical %>% 
  rename(year = Period,
         Cases = First.Tooltip)

data <-week7 %>%
  
  select(Location, Nursing_per_10000, doctors_per_10000, NTDs)
names(data)[names(data)=='Location'] <-"region"
mapdata <-map_data("world")
mapdata <-left_join(mapdata,data, by='region')
mapdata1 <-mapdata %>%filter(!is.na(mapdata$Nursing_per_10000))

# Choropleth maps 
map1 <-ggplot(mapdata1, aes(x=long, y=lat, group=group)) +
  geom_polygon(aes(fill= Nursing_per_10000), colour="grey") 

map1
map2 <- map1 + scale_fill_gradient(name = "Nursing_per_10000", low = "yellow", high =  "red", na.value = "grey50")+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        rect = element_blank()) 

# UI stands for user interface and explains to us how our Shiny App will look
ui <- fluidPage(
  navbarPage("Healthcare Report",
             tabPanel("Neglected Tropical Diseases",
                      titlePanel("Lets talk about Tropical Diseases!"),
                      theme = bslib::bs_theme(bootswatch = "minty"),
                      sidebarLayout(position = "right",
                                    sidebarPanel(p("FUN FACT: From the data table below we are able to see that overall the highest number of recorded Neglected Tropical Diseases were found in Cuba!")), mainPanel(p("Below we are able to see a scatter plot demonstrating the relationship between the amount of doctors available per 10,000 citizens and the number of neglected tropical diseases recorded in the corresponding country, this data was recorded in 2016 and if we use evidence from the research conducted of the spread of COVID-19, we can assume it should be a priority to target these diseases and perform research around them to avoid their spread and deadly growth."))
                      ),
                      plotOutput("plot", brush = "plot_brush", dblclick = "plot_reset"),
                      downloadButton(outputId = "downloadPlot",
                                     label = "Download Plot!"),
                      verbatimTextOutput("info"),
                      h6("The data presented here is demonstrating to us the differences in quality of life and standard of living across the globe."),
                      DT::dataTableOutput("mytable"),
                      
                      titlePanel("Should we be worried about Tropical Diseases in 2022?"),
                      h6("Yes! Tropical Diseases are being recorded across the globe and after COVID-19, can we really take the risk of ignoring them? It is a great start that we have made a start in acknowledging the signifigance of these diseases with World NTD day which was this year on January 30th (2022), a virtual event organised by WHO!"),
                      
                      
                      selectizeInput(
                        inputId = "Countries", 
                        label = "Select a country", 
                        choices = unique(tropical$Location), 
                        selected = "Germany",
                        multiple = TRUE
                      ),
                      plotlyOutput(outputId = "p"),
                      h6("From The Line chart here we are able to see the growth of Tropical Diseases from the year 2000-2018, this gives us enough evidence to approximate that in decades these diseases could grow uncontrollably, making it necessary to tackle their spread from now!")),
             
             
             tabPanel("Adolescent Birth Rate",
                      titlePanel("Adolescent Birth Rate visualisation app"),
                      sidebarLayout(position = "right",
                                    sidebarPanel(p("We can assume that more women in Africa and regions of Asia fall pregnant at a younger age due to lack of education involving contraceptive methods, also due to a lack of doctors available per 1000 people as we have already explore")),
                      
                      mainPanel(DT::dataTableOutput("birth"),
                                h6("Generally we can see that countries within West/Central Africa as well as regions within sub-saharan Africa seem to experience the highest numbers of women pregnant below the age of 19, there are many factors that contribute to these figures which we will explore"),
                      
                      selectizeInput(
                        inputId = "Region", 
                        label = "Select a region", 
                        choices = unique(birth$Location), 
                        selected = "Germany",
                        multiple = TRUE
                      ),
                      plotlyOutput(outputId = "plot2"))
                      ))
  ))

                      
                        
                    

# Server function focuses on outputs to match what was created while formatting the user interface
server <- function(input, output, session,...) {
  output$mytable = DT::renderDataTable({
    DT::datatable(data, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))})
    
  selected <- reactiveVal(rep(FALSE, nrow(data)))
  
  observeEvent(input$plot_brush, {
    brushed <- brushedPoints(data, input$plot_brush, allRows = TRUE)$selected_
    selected(brushed | selected())
  })
  observeEvent(input$plot_reset, {
    selected(rep(FALSE, nrow(data)))
  })
  
  output$plot <- renderPlot({
    data$region <- selected()
    ggplot(data, 
           aes(x = doctors_per_10000, y = NTDs, size = Nursing_per_10000)) +
      geom_point(alpha = .5, 
                 fill="cornflowerblue", 
                 color="black", 
                 shape=21) +
      scale_size_continuous(range = c(1, 14)) +
      labs(title = "Can we find Tropical Neglected diseases in many places around the world?",
           subtitle = "These diseases include dengue, lymphatic filariasis, trachoma, and leishmaniasis",
           x = "Doctors available per 10,000 citizens",
           y = "Neglected Tropical Diseases recorded in 2016",
           size = "Nurses available per 10,000 citizens")+
      ylim(0,66)
  
})
  
  output$p <- renderPlotly({
    plot_ly(tropical, x = ~year, y = ~Cases) %>%
      filter(Location %in% input$Countries) %>%
      group_by(Location) %>%
      add_lines() 
  })
  
  output$table <- renderDT({
    
    datatable(tropical %>%
                select(1:8))
    
  })
  
  output$plot2 <- renderPlotly({
    plot_ly(birth, x = ~year, y = ~rate_per_1000) %>%
      filter(Location %in% input$Region) %>%
      group_by(Location) %>%
      add_lines() 
  })
  
  output$birth = DT::renderDataTable({
    DT::datatable(birth, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))})
  
}


# Running the App itself
shinyApp(ui, server)

