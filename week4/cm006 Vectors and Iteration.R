#---
# March 23, 2017
# cm006 Vectors and Iteration
#---

library(tidyverse)
set.seed(1234)

# VECTOR
# Subset the vector
(x <- 1:10)
x[c(1:4, 7)] # keep the first through fourth elements, plus the seventh element
x[c(1:8, 10)] # keep the first through eighth elements, plus the tenth element
x[x>5] # keep all elements with values greater than five
x[x %% 3 == 0] # keep all elements evenly divisible by three

# subset a list
a <- list(a = 1:3, b = "a string", c = pi, d = list(-1, -5))
str(a)
# an atomic vector
a[[1]] 
a$a
a[["a"]]
# subset pi. The result should still be a new list
a[3]
a["c"]
# subset the first and third elements from a
a[c(1, 3)]
a[c("a", "c")]

# ITERATION
df <- tibble(
  a = rnorm(10), 
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
output <- vector(mode = "double", length = ncol(df))
for (i in seq_along(df)) {            # 2. sequence
  output[i] <- median(df[[i]])      # 3. body
}
str(output)

# FOR loop: means of columns in mtcars
as_tibble(mtcars)
avg <- vector(mode = "double", length = ncol(mtcars))
for (i in seq_along(mtcars)){
  avg[i] <- mean(mtcars[[i]], na.rm = TRUE)
}
avg

# FOR loop: maximum value in each column of diamonds
max <- vector(mode = "double", length = ncol(diamonds))
for (i in seq_along(diamonds)){
  if (is.numeric(diamonds[[i]]))
    max[i] <- max(diamonds[[i]])
  else
    max[i] <- NA
}
names(max) <- names(diamonds)
max

# MAP function: mean of columns in mtcars
map_dbl(mtcars, mean, na.rm = TRUE)

# MAP function: maximum value in each column of diamonds
map_dbl(diamonds, max)
