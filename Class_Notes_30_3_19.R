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

# mapply FUNCTION

# mapply is a multivariate apply of sorts which applies 
# a function in parallel over a set of arguments

#function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, 
#USE.NAMES = TRUE)  

# FUN is a function to apply
# ... contains arguments to apply over
# MoreArgs is a list of other arguments to FUN
# SIMPLIFY indicates wether the result should be simplified

# lapply, sapply, tapply only applies a function to a single
# object

# when you have two lists, where an element of the first list
# goes into an argument of the function, and an element
# of the second list go into another argument of the function
# you have to use mapply if you don't want to mess with
# for loops. 

# mapply can take multiple list arguments and then apply function
# to the elements of those lists in parallel.

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

# instead we can do

mapply(rep, 1:4, 4:1)

# same thing as above

noise <- function(n, mean, sd){
  rnorm(n, mean, sd)
}

noise(5, 1, 2) # works fine

noise(1:5, 1:5, 2) # doesn't work

#I want to have one random normal with mean 1, 
# 2 random normals with mean 2, 3 random normals with mean 3

mapply(noise, 1:5, 1:5, 2) # works!

# same as
list(noise(1, 1, 2), noise(2, 2, 2), noise(3, 3, 2), noise(4, 4, 2), noise(5, 5, 2))


# tapply FUNCTION

# used to apply a function over subsets of a vector. 

#arguments of tapply

# x is a vector
# INDEX is a factor or a list of factors
# FUN is a function to be applied
# ... contains other arguments to be passed to FUN
# simplyfy, to simplify the results

# ***
# INDEX is a vector of same length with x. it indicates 
# for example which observations are men, and which are women
# ***

x <- c(rnorm(10), runif(10), rnorm(10, 1))

f <- gl(3, 10) # factor variables with 3 levels

tapply(x, f, mean)

#1          2          3 
#-0.2615724  0.5459412  1.0702702 

#gives the mean of all subsets indicated with factor vector f

tapply(x, f, mean, simplify = FALSE) # returns a list
# instead of a vector


#$`1`
#[1] -0.2615724
#
#$`2`
#[1] 0.5459412
#
#$`3`
#[1] 1.07027


tapply(x, f, range) # returns min and max, so the output
# is a list with two elements in each element

#$`1`
#[1] -1.861768  1.551435

#$`2`
#[1] 0.03754318 0.94342789

#$`3`
#[1] -1.138246  3.021489


# split ****

#takes a vector of other objects and splits it into groups
# determined by a factor or list of factors

str(split)
#function (x, f, drop = FALSE, ...)  

# x is a vector (or list) or data frame
# f is a factor (or coerced to one) or a list of factors
#drop indicates wether empty factors levels should be dropped

#tapply is useful because it breaks lists into factors, applies
# the function, and brings them together again.
#split is like tapply, but without the statistics

split(x, f)
#$`1`
#[1] -1.8617679 -0.3048470  1.5514351  0.1479850  0.6869013
#[6] -1.3775540  1.2756217 -0.1518388 -0.9552202 -1.6264392

#$`2`
#[1] 0.39417273 0.94342789 0.42465677 0.16177029 0.84940117
#[6] 0.03754318 0.73712011 0.80812835 0.79475433 0.30843719

#$`3`
#[1]  0.5421373  3.0214891  2.3038140  0.4343200  0.2990374
#[6]  2.2996320 -1.1382459  1.2579739  0.9110056  0.7715383


#it's common to use split with lapply function

lapply(split(x, f), mean) # you can also use tapply here as well
# but just to give you an idea

library(datasets)
head(airquality)

# calculate the mean of ozone, wind and temperature in each
# month

# split the dataframe into monthly pieces, then you can calculate
#columnmeans

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

# returns exactly what you want with a three element list

# but there are missing values so some is NA.

# you can use sapply here, because all elements of the list
# has length 3

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
#still NAs
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
#there, fixed.

# split is very useful to split arbitrary variables into factors

# SPLITTING ON MORE THAN ONE LEVEL

x <- rnorm(10)

f1 <- gl(2, 5)
f2 <- gl(5, 2)

interaction(f1, f2) # to combine all leves of f1 with f2
# because they both have 10 variables 

str(split(x, list(f1, f2)))

# gives a list of 10

# there are some empty levels. you could take this list and
# apply lapply or sapply over it.

# instead, use drop = TRUE arg

str(split(x, list(f1, f2), drop = TRUE))

# *** DEBUGGIN TOOLS ***

# indications that something's not right

#message : tame notification, diagnostic message, it could be nothing
# won't stop the function from executing 
#message function

#warning : indication that something unexpected happened
#sometimes you may want to ignore warnings. won't stop executing
#generated by warning function

#error : last stop. fatal problem. stops execution. 
# error messages are produced. produced by stop function

#condition : a generic concept for indication that something
# unexpected can occur

log(-1)
#[1] NaN
#Warning message:
#  In log(-1) : NaNs produced

# typical warning. maybe you don't care. you don't want
# the function's behaviour to stop

printmessage <- function(x) {
        if(x > 0)
            print("x is greater than zero")
        else
            print("x is less than or equal to zero")
        invisible(x) #stops or prevents auto printing the 
        # lastly used element- in this case the numeric vector.
        # if you call invisible, it will still return the same object,
        # but will not autoprint to console
}

printmessage(1) # works fine

printmessage(NA) #error here. NA > 0 is not defined. it can't move out
# so it has to error out.
# it was expecting TRUE/FALSE value


printmessage2 <- function(x) {
      if(is.na(x))
          print("x is a missing value!")
      else if(x > 0)
          print("x is greater than zero")
      else
          print("x is less than or equal to zero")
      invisible(x) #stops or prevents auto printing the 

}


x<- log(-1)

printmessage2(x)



#how do you know that something is wrong with your function?

#what was your input? how did you call the function?
#what were you expecting? output, messages, other results?
#what did you get?
#how does what you get differ from what you were expecting?
#were your expectations correct in the first place?
#can you reproduce the problem(exactly)? ********!!!!!!!!!













