# Week 3 Lectures

# LOOP FUNCTIONS AND DEBUGGING

# lapply, apply, tapply, split, mapply



# execute a loop on a set of objects
# a lot of work in a very small space

#lapply : loop over a list and evaluate a function on each element
#sapply : same as lapply, but try to simplify the result
#apply : apply a function over the margins of an array
# tapply : apply a function over subsets of a vector(table apply)
# mapply : multivariate version of lapply

#an auxiliary function split is also useful, particularly
# in conjunction with lapply
# it splits objects to sub pieces

x <- list(a = 1:5, b = rnorm(10))

lapply(x, mean)

# returns a list. ALWAYS returns a list.

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))

lapply(x, mean)

x<- 1:4

lapply(x, runif)

lapply(x, runif, min = 0, max = 10)

x <- list ( a = matrix(1:4, 2, 2 ), b = matrix(1:6, 3, 2))

lapply(x, function(elt)elt[,1]) #anonymous function

# sapply will try to simplify the result of lapply is possible

# if the result is a list where every element is length1,
#then a vector is returned

# if the result is a list where every element is a vector
#of the same length(>1), a matrix is returned

# if it can't figure things out, a list is returned

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))

lapply(x, mean)

sapply(x, mean) 



# APPLY function



