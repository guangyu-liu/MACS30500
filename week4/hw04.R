#---
# March 23, 2017
# hw04
#---

# Part 1: Programming exercises
# 1. Compute the number of unique values in each column of iris
# FOR loop:
as_tibble(iris)
uniqueValue <- vector(mode = "integer", length = ncol(iris))
for (i in seq_along(iris)){
  uniqueValue[i] <- n_distinct(iris[[i]])
}
names(uniqueValue) <- names(iris)
uniqueValue

# MAP function:
map_int(iris, n_distinct)

# 2. Calculate the square of each element in vector x
x <- 1:30
x
# FOR loop:
square <- vector(mode = "integer", length = length(x))
for (i in seq_along(x)){
  square[i] <- x[i]^2
}
square

# MAP function
sq <- function(x){
  x^2
}
map_dbl(x, sq)

# 3. Pythagorean theorm
pythagorean <- function (a = NULL, b = NULL, c = NULL){
  if ((!is.numeric(a) & !is.null(a)) | (!is.numeric(b) & !is.null(b)) | (!is.numeric(c)) & !is.null(c))
    stop("non numeric arguments")
  if ((is.null(a) + is.null(b) + is.null(c)) != 1)
    stop("function pythagorean only accept two arguments")
  if (!is.null(a) & !is.null(b) & is.null(c)){
    if (a <= 0 | b <= 0)
      stop("length of side of triangle should be positive")
    c = sqrt(a^2+b^2)
    return(paste0("c = ",sqrt(a^2+b^2), " two angles are ", asin(a/c)*180/pi, ", and ", asin(b/c)*180/pi))
  }
  else if (!is.null(a) & is.null(b) & !is.null(c)){
    if (a <= 0 | c <= 0)
      stop("length of side of triangle should be positive")
    if (c > a){
      b = sqrt(c^2-a^2)
      return(paste0("b = ",sqrt(c^2-a^2), " two angles are ", asin(a/c)*180/pi, ", and ", asin(b/c)*180/pi))
    }
    else
      stop("the hypotenuse should be greater than the right side")
  }
  else{
    if (c < 0 | b < 0)
      stop("length of side of triangle should be positive")
    if (c > b){
      a = sqrt(c^2 - b^2)
      return(paste0("a = ",sqrt(c^2-b^2), " two angles are ", asin(a/c)*180/pi, ", and ", asin(b/c)*180/pi))
    }
    else
      stop("the hypotenuse should be greater than the right side")
  }
}
pythagorean(b = 4, c = 5)

# Part 2: Using programming in data analysis