library(tidyverse)
ggplot(data = mpg, mapping = aes(displ, hwy)) +
  geom_point(aes(color = class), show.legend = FALSE) +
  geom_point(data = filter(mpg, hwy > 40), color = "red")

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth), 
    fun.ymin = min, 
    fun.ymax = max, 
    fun.y = median
  )

ggplot(data = diamonds) +
  geom_line (mapping = aes(x = cut, y = depth)) +
  geom_point(mapping = aes(x = cut, y = mean(depth)))+
  theme(aspect.ratio = 2)

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class)) +
  coord_flip() 

usa <- map_data("usa")
ggplot(usa, mapping = aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "blue") +
  coord_map()

ggplot(data = diamonds) +
  geom_point(mapping = aes(carat, price)) +
  theme(aspect.ratio = 2)

ggplot(diamonds) +
  geom_bar(mapping = aes(cut, fill = color), show.legend = TRUE, width = 1) +
  coord_polar()

ggplot(mpg) +
  geom_point(mapping = aes(cty, hwy)) +
  geom_abline()
  coord_fixed()
  