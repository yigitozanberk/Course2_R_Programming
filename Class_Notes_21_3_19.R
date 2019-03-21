# CLASS NOTES 21/3/19

# Subsetting

# bracket [ ], always returns an object of the same class
# as the original

# double bracket [[ ]], used to extract elements of a list
# or a data frame

# classes of different elements may vary

# dollar sign $, used to extract elements that have 
# a name

# so that you can reference by different name

# semantics are the same as double bracket

x <- c("a", "b", "c", "d", "a")
x[1] #you can extract different elements, or sequences

x[1:4]

x[x> "a"] # returns character vector with letters
# grater than "a"

u <- x> "a"
u #gives out logical results of each element

# SUBSETTING LISTS

x <- list(foo = 1:4, bar = 0.6)

x[1] # x is a list, so x[1] is going to be a list too

x[[1]] # x is a list, but the return is a vector

x$bar # gives you the element that is associated with the
# name bar

x[["bar"]] # same as x$bar

x["bar"] #returns a list because x is a list

# subsetting allows you to be convenient, you don't have
# to remember where the element is in the list.

# if you need to extract more than one element
# of the list you need to use the single bracket operator

x[c(1,3)]

# double bracket does not work here

# double bracket operator can be used
# with computed indices; $ can only be used with 
# literal names

x <- list( foo =1:4, bar = 0.6, baz = "hello")

name <- "foo" #string 'foo'

x[[name]] # computed index for 'foo'

x$name # element 'name' doesn't exist!!!!
# literally looks for an element named 'name'

x$foo # gives out 1 2 3 4 

x <- list(a = list(10,12,14), b= c(3.14, 2.81))

# to get 14 from list a, you need to ask for
# the 3rd element of 1st element of the list x
# with the double bracket.

x[[c(1,3)]]

#this gives out the 3RD ELEMENT OF 1ST ELEMENT

# SUBSETTING MATRICES

x<- matrix(1:6, 2, 3)

x[1,2] # gives you first row second column

x[1, ] # indices can also be missing. 
# here you get the first row of the matrix

# this type of subsetting gives you a vector of length 1
# instead
# of a matrix. to keep the matrix form, you need to
# set this behavior off by setting drop = FALSE *****
# by default, drop equals TRUE, and it drops dimension

x[1, 2, drop = FALSE]

# similarly, if you subset a single column or row,
# it will give you a vector, not a matrix by default

x[ 1, , drop= FALSE]

# PARTIAL MATCHING

#can save you a lot of typing

x <- list(aardwark = 1:5)

# if you don't want to type aardwark every time, 
# you can use just "a" with dollar sign

x$a # it looks for a name in the list that matches
# a. in this case only aardward matches "a" so it finds it

# double bracket operator doesn't do partial matching.

# if you want to bypass this

x[["a", exact = FALSE]]

# is the solution

# REMOVING MISSING VALUES

x <- c(1, 2, NA, 4, NA , 5)

bad <- is.na(x) # creates logical vector

x[!bad] # clears NAs
# gives out the inverse TRUEs of vector "bad"

# WHEN THERE IS MULTIPLE VECTOR

x<- c(1,2,NA, 4,NA,5)
y <- c("a", "b", NA, "d", NA, "f")

good <- complete.cases(x,y) #gives out positions
# in which BOTH vectors have non-missing values

x[good]

y[good]

airquality[1:6,]
# if you want to remove missing values from a dataframe
# i want the rows of the data frame where all values 
# are non missing

good <- complete.cases(airquality)
# logical vector tells us which rows are full

airquality[good, ][1:6,]


# VECTORIZED OPERATIONS

# easy to use on the command line without lots
# of looping

x <- 1:4; y <- 6:9

x + y # adds first element of x to first of y, etc...

x >2 # gives out logical vector containing each element
# slot

y ==8 

x / y

# R can do these easily 

x <- matrix(1:4, 2, 2); y<- matrix(rep(10,4), 2, 2)

x + y # element based addition

x / y # element based division

x %*% y # true matrix multiplication

# to find the number of TRUEs in a logical vector
# myvector <- is.na(mylist$mycolumn)
# table(myvector)["TRUE"]

# QUIZ Done.


  
  
  
  
  
  
  
  



