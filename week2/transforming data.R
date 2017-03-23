#cm003
library(tidyverse)
str(diamonds)

# mean of ideal cut diamonds
data ("diamonds")
diamonds_ideal <- filter(diamonds, cut == "Ideal")
summarize(diamonds_ideal, avg_price = mean(price))

# mean of each cut
diamonds_cut <- group_by(diamonds,cut)
summarize(diamonds_cut, avg_price = mean(price))

# average carat size and price for each cut of "I" colored diamonds
diamonds_I <- filter(diamonds, color == "I")
diamonds_cut <- group_by(diamonds_I, cut)
summarize(diamonds_cut, avg_price = mean(price), avg_size = mean(carat))

# college education
devtools::install_github("uc-cfss/rcfss")
library(rcfss)
data("scorecard")

# greater than 40% first generation students
first_gen <- scorecard %>%
  filter(firstgen > 0.40)
first_gen

# 10 most expensive colleges
arrange(scorecard, desc(cost)) %>%
  slice(1:10)

# highest average SAT score
group_by(scorecard, type) %>%
  summarize(avg = mean(satavg, na.rm = TRUE))

#cheaper than UofChicago
UChi <- scorecard %>%
  filter(type == "Private, nonprofit") %>%
  mutate(row = percent_rank(cost)) %>%
  filter(name == "University of Chicago")
