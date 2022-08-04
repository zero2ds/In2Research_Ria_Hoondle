# Installing packages
library(ggplot2)
library(tidyverse)
library(ggraph)
library(igraph)
library(RColorBrewer)
library(gapminder)
library(gganimate)
library(gifski)
library(gapminder)
library(dplyr)

# Creating dataset
df <- subset(fundamentals, select=c("X","Ticker.Symbol","Cash.Ratio", "Current.Ratio","Gross.Margin"))
df <- subset(fundamentals, select=c("X","Ticker.Symbol","Cash.Ratio", "Current.Ratio","Gross.Margin"))
new_df <- df %>% drop_na(Cash.Ratio, Current.Ratio, Gross.Margin)
new_df_1 <- df[c(1:20),]
new_df_1 %>% 
  rename(value1 = Cash.Ratio,
         value2 = Current.Ratio,
         value3=Gross.Margin) 

# Plotting barplot
ggplot(new_df_1, aes(x=Ticker.Symbol, y=Cash.Ratio, fill=Ticker.Symbol)) + 
  geom_bar(stat='identity')+
  theme_bw() +
  transition_states(
   Ticker.Symbol,
    transition_length = 2,
    state_length = 1
  ) +
# Creating animation
  ease_aes('sine-in-out')
# Saving animation
anim_save("CashRatio.gif")

# Creating animated bubble chart
fundamentals <- read.csv("fundamentals.csv",header = TRUE)
df <- fundamentals[c(1:30),]
df[["Period.Ending"]] <- c(2012,2013,2014,2015,2012,2013,2015,2016,2013,2014,2015,2016,2012,2013,2014,2015,2013,2014,2015,2016,2012,2013,2014,2015,2013,2014,2015,2016,2013,2014)
ggplot(df, aes(After.Tax.ROE,Cash.Ratio, size = Accounts.Payable, color = Ticker.Symbol)) +
  geom_point() +
  scale_x_log10() +
  theme_bw() +
  labs(title = 'Time Period: {frame_time}', x = 'After Tax ROE', y = 'Cash Ratio') +
  transition_time(Period.Ending) +
  ease_aes('linear')
gapminder
# Saving gif
anim_save("AnimatedBubble.gif")

ggplot(df, aes(After.Tax.ROE,Cash.Ratio, size = Accounts.Payable, color = X)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_x_log10() +
  facet_wrap(~Ticker.Symbol)+
  labs(title = 'Year: {frame_time}', x = 'After Tax ROE', y = 'Cash Ratio') +
  transition_time(Period.Ending) +
  ease_aes('linear')

anim_save("Facet.gif")

# Creating the interactive packing circles plot
fundamentals
df <- subset(fundamentals, select=c("X","Cash.Ratio"))
new_df_1 <- df[c(1:30),]
data <- new_df_1 %>% 
  rename(value = Cash.Ratio,
         group = X)

library(packcircles)
library(ggplot2)
library(viridis)
library(ggiraph)

data$text <- paste("name: ",data$group, "\n", "value:", data$value, "\n", "Cash Ratio")

packing <- circleProgressiveLayout(data$value, sizetype='area')
data <- cbind(data, packing)
dat.gg <- circleLayoutVertices(packing, npoints=50)

p <- ggplot() + 
  geom_polygon_interactive(data = dat.gg, aes(x, y, group = id, fill=id, tooltip = data$text[id], data_id = id), colour = "black", alpha = 0.6) +
  scale_fill_viridis() +
  geom_text(data = data, aes(x, y, label = gsub("Group_", "", group)), size=2, color="black") +
  theme_void() + 
  theme(legend.position="none", plot.margin=unit(c(0,0,0,0),"cm") ) + 
  coord_equal()
p
widg <- ggiraph(ggobj = p, width_svg = 7, height_svg = 7)
widg

# Creating an animated 3D chart with R and image Magick
library(lattice)
df <- subset(fundamentals, select=c("X","Ticker.Symbol","Cash.Ratio", "Current.Ratio","Gross.Margin"))
