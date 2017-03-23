#---
# March 22, 2017
# cm005 Pipes and Functions in R
#---

library(tidyverse)
library(rcfss)

# Pipes in R
diamonds %>% 
  filter(color == "I") %>% 
  group_by(cut) %>% 
  summarise(avg = mean(price))

gun_deaths %>% 
  filter(year == 2012 & sex == "M" & race == "White") %>% 
  group_by(education) %>% 
  summarise(killedNum = n())

# Functions in R
# Sum of squares of two variables
my_function <- function(x, y){
  return(x^2+y^2)
}
my_function(3, 4)

x <- c(2, 4, 6)
y <- c(1, 3, 5)
my_function(x, y)

# fizzbuzz
fizzbuzz <- function(x){
  if (x %% 3 == 0){
    if (x %% 5 == 0){
      return("fizzbuzz")
    }
    return("fizz")
  }
  if (x %% 5 == 0){
    return("buzz")
  }
  return(x)
}
fizzbuzz(3)
fizzbuzz(5)
fizzbuzz(15)
fizzbuzz(4)
