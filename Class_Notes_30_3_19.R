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

# used to evalueate a function over the margins of an array

# it is most often used to apply a function to the rows and columns 
#of a matrix

#main reason is less typing
#not really faster than writing a loop, but it works in one line!

#> str(apply)
#function (X, MARGIN, FUN, ...)  

x <- matrix( rnorm(200), 20, 10)

apply(x, 2, mean) #you get back a vector of length 10. you get 
#the mean of the rows in each column.

#[1] -0.15924828 -0.11983081  0.04180181 -0.05572046  0.42605205
#[6]  0.19295994 -0.08357798 -0.02553813  0.34856895  0.35111574

apply(x, 1, sum) # you get back a vector of length 20. you get
#the sum of the columns in each row.

#[1] -0.9659285 -3.4423673  0.6341151 -1.4013387  2.4990038
#[6] -1.3572107  3.0411033 -6.3435237  4.4975145  1.0542415
#[11]  3.5367498 -0.1073805  3.0504247 -2.2884969  5.4786598
#[16]  5.8852967  2.2423967  1.9869143 -1.8397047  2.1711874


# for sums and means of matrix dimensions, we have some shortcuts

# rowSums = apply(x, 1, sum)
# rowMeans = apply(x, 1, mean)
# colSums = apply(x, 2, sum)
# colMeans = apply(x, 2, mean)

# shortcut functions are MUCH faster, but you won't notice
# unless you're using a large matrix

x <- matrix(rnorm(200), 20, 10)

apply(x, 1, quantile, probs = c(0.25, 0.75))

# suppose have a matrix which you want to go through each row
# and calculate the 25th and 75th percentile of that row.

# quantile function needs the quantiles to be able to calculate.
# so you pass that arg with the ... in the apply function.

#[,1]       [,2]       [,3]      [,4]       [,5]
#25% 0.3201842 -0.9211562 -0.5298841 -0.911617 -0.6701228
#75% 0.7965296  0.1867119  0.5598767  0.645285  0.2606940
#[,6]      [,7]       [,8]        [,9]      [,10]
#25% -0.7077127 -0.917864 -1.1154478 -0.97269900 -0.8694346
#75%  0.9959374  1.119335  0.3510115  0.03083152  0.2756760
#[,11]      [,12]      [,13]       [,14]       [,15]
#25% -0.414515 -0.4937602 -0.3867624 -0.04742986 -1.57642253
#75%  1.013608  0.8316942  0.7622362  0.46455198 -0.08776169
#[,16]     [,17]      [,18]      [,19]       [,20]
#25% -0.6315636 0.1617558 -0.8090267 -1.2283619 -1.01930243
#75%  0.6284020 1.2488737  0.7797473  0.7428234  0.01317106

a <- array(rnorm(2*2*10), c(2,2,10))

apply(a, c(1,2), mean) #3 is not in the c(1 , 2) so you want to collapse the 3rd 
#dimension

#when you want the average of 2 * 2 matrices

#it'll take your array, and average over the 3rd dimension. 
# so the average values of the 10 - 2 x 2 matrices is printed out 
# as a 2 x 2 matrix

#equivalent

rowMeans(a, dims = 2)



