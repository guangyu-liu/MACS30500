#---
# March 23, 2017
# cm007 Debugging and defensive programming
#---

library(tidyverse)
library(rcfss)
set.seed(1234)

# Build a function with conditions
# stop()
sqrt_sum <- function(x, y){
  if (x + y < 0) stop('You cannot take the square root of a negative number')
  return(sqrt(sum(x, y)))
}
sqrt_sum(3, -6)

# warning()
sqrt_sum <- function(x, y){
  if (x + y < 0){
    warning('The sum of these numbers is negative, NaN produced')
    return(NaN)
  }
  return(sqrt(x + y))
}
sqrt_sum(3, -6)

# safely()
x <- list("a", 4, 5)
y <- x %>% 
  map(safely(sqrt))
str(y)
y <- y %>% 
  transpose()
str(y)
is_ok <- y$error %>% 
  map_lgl(is_null)
x[!is_ok]
y$result[is_ok] %>% 
  flatten_dbl()

# Exercise
# 1. Write an interative operation that safely calculates the maximum value for every column in gun_deaths
y <- map(gun_deaths, safely(max), na.rm = TRUE) %>% 
  transpose()
is_ok <- y$error %>% 
  map_lgl(is.null)
y$result[!is_ok]

# 2. Perform the same operation as above, but replace error messages with a missing value
y <- map(gun_deaths, possibly(max, NA), na.rm = TRUE)
str(y)
