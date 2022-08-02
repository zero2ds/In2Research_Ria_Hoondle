fundamentals
df <- subset(fundamentals, select=c("X","Cash.Ratio"))
new_df_1 <- df[c(1:30),]
data <- new_df_1 %>% 
  rename(value = Cash.Ratio,
         group = X)
data

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

widg <- ggiraph(ggobj = p, width_svg = 7, height_svg = 7)
widg
