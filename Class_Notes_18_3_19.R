x <- 1
msg <- "hello"  #string object
print(x) #prints value of x, output is vectoral
# [1] is to indicate the first element of the vector
x <- 1:20 # colon is used to create a sequence

#now x is a sequence

#the number in the brackets indicate the number of the 
#element at the beginning of the row

# Object types = character, numberic(double), integer, 
# complex, and logical(TRUE/FALSE)

# one exception is list = can contain different classes

# empty vectors can be created with the vector() function

#if you explicitly want integer, you need to specify with
#the L suffix. 1L gives you integer, 1 gives numeric

# Inf represents infinity. e.g. 1 / Inf is 0

#R objects can have attributes; names, dimensions, class,
# length, and other user-defined attributes/metadata

# attributes() function allows to modify these.

# c() for concatanate

# z <- c("a", TRUE) gives a character vector with
# "a" and "TRUE"
# R coerces upwards

# BE CAREFUL FOR BEHIND THE SCENES COERCIONS

x <- 0 : 6

# as.character(x) outputs the contents as characters
# as.logical(x) outputs false for 0 and true for bigger 
# values than 0

x <- list(1, "a", TRUE, 1 +4i)

#creates a list, elements are indexed with double [[]]

# ----MATRICES---

m <- matrix(nrow = 2, ncol =3)

dim(m) #gives the dimension attributes. rows and columns

attributes(m) # outputs the attributes

m <- matrix (1:6, nrow =2, ncol =3)

n <- 1:10
dim(n) <- c(2, 5) #transforms n into a matrix of 2 rows
 # and 5 columns

# to create matrices from two vectors

x<- 1:3
y <- 10:12

cbind(x,y) # puts elements x, y to columns

rbind(x, y) # puts elements x, y to rows










