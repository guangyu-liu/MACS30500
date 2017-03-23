#average life expectancy, per continent
ggplot (gapminder, aes(continent, lifeExp)) +
  geom_boxplot()

#relationship between GDP and life expectancy
ggplot (gapminder, aes(gdpPercap, lifeExp)) +
  geom_point() +
  geom_smooth()

#relationship moderated by continent
ggplot (gapminder, aes(gdpPercap, lifeExp, color = continent, group = continent)) +
  geom_point() +
  geom_smooth()

#causing the outliers
ggplot (gapminder, aes(gdpPercap, lifeExp)) +
  geom_point() +
  geom_smooth() +
  geom_text(aes (label = country))
