# creating an interactive scatter plot
library(ggplot2)
library(plotly)
library(gapminder)
gapminder
life_expectancy

data <- life_expectancy %>%
  filter(Dim1=="Both sexes") %>%
  ggplot(aes(Period,First.Tooltip, size=.05, colour=Location))+
  geom_point()+
  labs(x="Year", y="Life Expectancy")
  theme_bw()
ggplotly(data)

#creating an interactive heatmap
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(plotly)
library(heatmap3)
library(heatmaply)

data <-correlation_data %>%
  filter(Location %in% c("France", "Sweden", "Italy", "Spain", "England", "Portugal", "Greece", "Peru", "Chile", "Brazil", "Argentina", "Bolivia", "Venezuela", "Australia", "New Zealand", "Fiji", "China", "India", "Thailand", "Afghanistan", "Bangladesh", "United States of America", "Canada", "Kenya")) %>%
  arrange(Location) %>%
  mutate(Location = factor(Location, Location))

mat <-data
rownames(mat) <- mat[,1]
mat <- mat %>% dplyr::select(-Location)
mat <- as.matrix(mat)
p <- heatmaply(mat, 
               dendrogram = "none",
               xlab = "Healthcare data", ylab = "Country", 
               main = "Global Healthcare data in 2010",
               scale = "column",
               margins = c(60,100,40,20),
               grid_color = "white",
               grid_width = 0.00001,
               titleX = FALSE,
               hide_colorbar = TRUE,
               branches_lwd = 0.1,
               label_names = c("Country", "Feature:", "Value"),
               fontsize_row = 5, fontsize_col = 5,
               labCol = colnames(mat),
               labRow = rownames(mat),
               heatmap_layers = theme(axis.line=element_blank())
)
p
