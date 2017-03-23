# categorical variables
ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut))

diamonds %>%
  count(cut)

# histogram
ggplot(diamonds) +
  geom_histogram(mapping = aes(carat), bins = 60) +
  coord_cartesian(ylim = c(0,50))

# display outliers
diamonds %>%
  filter(y > 20) %>%
  arrange(y)

#--- one categoricat & one continuous
# frequency polygon
ggplot(diamonds, mapping = aes(x = price, y = ..density..)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

# boxplot
ggplot(diamonds, mapping = aes(x = cut, y = price)) + 
  geom_boxplot()

#---two categorical variables---
# geom_count()
ggplot(diamonds, mapping = aes(x = cut, y = color)) +
  geom_count()

# geom_tile()
diamonds %>%
  count(color, cut) %>% 
  ggplot(diamonds, mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

#---two continuous variables ---
ggplot(diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(alpha = 0.1) +
  geom_smooth()

# bin
ggplot(diamonds, mapping = aes(x = carat, y = price)) +
  geom_bin2d()

#---in class exercise---
# highest average SAT score by type of college
ggplot(scorecard, mapping = aes(x = type, y = satavg)) +
  geom_boxplot(na.rm = TRUE)

ggplot(scorecard, mapping = aes(satavg, color = type)) +
  geom_histogram()

ggplot(scorecard, mapping = aes(satavg, color = type)) +
  geom_freqpoly() 

# relationship between college cost and faculty salary
ggplot(scorecard, mapping = aes(cost, avgfacsal)) +
  geom_hex() +
  geom_smooth()

# relationship between Pell Grant recipients and the average student's education debt
ggplot(scorecard, aes(pctpell, debt)) +
  geom_hex() +
  geom_smooth()
