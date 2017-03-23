library(tidyverse)
library(knitr)
library(rcfss)
data ("gun_deaths")
View(gun_deaths)

# 1. In what month do the most gun deaths occur?
ggplot(gun_deaths, mapping = aes(month)) +
  geom_bar()

count(gun_deaths, month) %>%
  arrange(desc(n)) %>%
  kable(caption = "Gun deaths in the United States by month", 
        col.names = c("month", "Number of death"))

# 2. Most common intent in gun deaths
ggplot(gun_deaths, mapping = aes(intent)) +
  geom_bar()

# 3. Average age of women killed by gun
gun_deaths %>%
  filter(sex == "F") %>%
  summarize(avgage = mean(age, na.rm = TRUE))

# 4. White males with at least high school education killed by gun
gun_deaths %>%
  filter(sex == "M" & education != "Less than HS" & race == "White") %>%
  count()

# 5. Which season the most gun deaths
season <- cut(gun_deaths$month, breaks = 4, label = c("Winter", "Spring", "Summer", "Fall"))
mutate(gun_deaths, season) %>%
  count(season) %>%
  kable(caption = "Gun deaths by season", col.names = c("season", "number of death"))

# 6. Relationship between race and intent
ggplot(gun_deaths, mapping = aes(race, fill = intent)) +
  geom_bar(position = "dodge")

# 7. Police involved gun deaths

