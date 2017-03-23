#---
# March 22, 2017
# cm004 Data Wrangling
#---

#---Parsing Vectors---#
library (tidyverse)

challenge_parsed <- read_csv(readr_example("challenge.csv"), 
                             col_types = cols(
                               x = col_double(),
                               y = col_date()
                             )
)
tail(challenge_parsed)

#--- Tidy Data: Principles and Practice ---#
# GATHER
table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")

# SPREAD
table2 %>% 
  spread(key = type, value = count)

# SEPARATE
table3 %>% 
  separate(col = rate, into = c("case", "population"), sep = "/")

# UNITE
table5 %>% 
  unite(col = "year4", century, year, sep = "")

# PRACTICE TIDYING DATA
library (rcfss)
library (stringr)
race %>% 
  gather(Time, Score, -Name, convert = TRUE) %>% 
  arrange(Name, Time)

results %>% 
  spread(key = Treatment, value = value)

grades %>% 
  gather(`Fall`, `Spring`, `Winter`, key = "Quarter", value = "Score") %>% 
  mutate(Test = str_c("Test", Test)) %>% 
  spread(Test, Score)

#--- Relational Data: A Fly by the Seat of Your Pants Introduction ---#

