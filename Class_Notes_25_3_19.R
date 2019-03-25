# WEEK 2 - if/else - loops - functions - lexical scoping/dynamic scoping - Dates/Time


# if/else, for, while, repeat, break, next, return

#IF/ELSE

#if(condition) {
#do something
#} else if {
#do something
#} else {
# do something
#}

if(x>3){y <-10}else{y<-0}

y<- if(x>3){10}else{0}

# FOR LOOPS

for(i in 1:10) {
  print(i)
}

# for loops are commonly used for iteration 
# over the elements of an object(list, etc.)

x<- c("a", "b", "c", "d")

for(i in 1:4) {print(x[i])}

for(i in seq_along(x)) {print(x[i])}

for(letter in x){print[letter]}

for(i in 1:4) print(x[i]) #if the for loop is one line

# for loops can be nested. you can have a for
# loop inside another for loop



# printing out the elements of a matrix

x <- matrix(1:6, 2,3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

#nesting beyond 2-3 levels is often very 
# difficult to read/understand - it's what
# we did in assembly

# you can get around that situation by using
# FUNCTIONS


#WHILE LOOP

count <- 0 

while(count<10){
  print(count)
  count <- count+1
}

# while loops can potentially result in infinite
# loops if not written properly

z<- 5
while(z >= 3 && z<= 10) {
  print(z)
  coin <- rbinom(1,1,0.5)
  
  if(coin==1) {
    z <- z + 1
  } else {
    z <- z - 1
  }
}

# REPEAT LOOOOOP

x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate()
  
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

# when you want to compute and iterate over and over
# again, and want to stop when the two values are
# close enough depending on your tolerances

#it's hard to predict how long this loop will run.

#it's usually not a good idea. try to use
# for loop which has a hard break instead.

# if your algorithm doesn't converge, you cannot
# understand it when using repeat loop.


# NEXT

for(i in 1:100) {
  if ( i <= 20) {
    next
  }
  #do something here
}

# return signals that a function should exit
# and return a given value



# FUNCTIONS 


add2 <- function(x, y) {
  x + y
}

# in R the function returns whatever the last 
# expression was.

above10 <- function(x) {
  use <- x> 10
  x[use]
}

above <- function(x, n=10) {
  use <- x > n # creates a logical vector
  x[use] #subsets x by the logical vector 'use'
}


columnmean <- function(y, removeNA= TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA) # !!! removes NAs from the mean calculation
  }
  means
}



# functions can be passed asarguments to other
# functions

#functions can be nested, so that you can define
# a function inside of another function

# functions have named arguments, which potentially
# have default values

# R function arguments can be matched positionally
# or by name

mydata <- rnorm(100)

sd(mydata)
sd(x = mydata)
sd(x=mydata, na.rm(FALSE))
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata) #in this case it works
# but don't test it, don't play with the order.

# you can mix positional matching with matching by name.
# when an argument is matched by name, it is
#"taken out" of the argument list, and the remaining
# unnamed arguments are matched in the order
# that they are listed in the function definition



# for argument matching, R does following:

# 1. check for exact match for a named argument
# 2. check for a partial match
# 3. check for a positional match


# arguments to functions are evaluated lazily.
# they are evaluated only as needed.

f <- function(a,b){
  a^2
}
f(2) # doesn't give error, because it didn't need
# to compute b.

f <- function(a,b) {
  print(a)
  print(b)
}

f(45)

# first gives out 45, then the error.
# the error does not come out until the error.


# '...' is often used when extending another function
# and you don't want to copy the entire argument
# list of the original function.

myplot <- function(x, y, type = "l", ...){
  plot(x, y, type = type, ...)
}

# generic functions use ... so that extra arguments
# can be passed to methods.


# ... is also necessary when the number of arguments
# passed to the function cannot be known in 
# advance.

# like the paste() function

args(paste)

# one catch with ... is, any arguments that appear
# after ... on the argument list must be named
# explicitly and cannot be partially matched.


#SCOPING RULES#####

lm <- function(x) { x * x }

# how does R know what value to assign to teh
# symbol lm? why doesn't it give it the value
# of lm that is in the stats package?

#when R tries to bind a value to a symbol,
# it searches through a series of environments
# to find the appropriate value. When you are
# working on the command line and need to retrive
# the value of an R object, the order is roughly

#1. search the global environment for a symbol
#name matching the one requested.

#2. search the namespaces of each of the packages
#on the search list.

# the search list can be found by using the 
# search() function

# global environment or the user's workspace is always
# the first element of the search list.
# and the base package is always the last.

# when a user loads a package with library() the
# namespace of that package gets put in position
# 2 of the search list(by default) and everything
# else gets shifted down the list.

# it is possible to have an object named c and a function named
# c at the same time


# SCOPING RULES

# if you're in a function, there are two types of arguments
# function arguments that are passed through the def.
# and non-function arguments.

# R uses lexical scoping - which is an alternative to dynamic scoping.

#useful for simplifying statistical calculations.

f <- function(x,y) {
  x ^ 2 + y / z # z is called a free variable. what to assign to z?
}

# in R, the values of free variables are searched for
# in the environment in which the function was defined.

# an environment is a collection of (symbol, value)
# pairs. i.e. x is a symbol and 3.14 might be its value

#every environment has a parent environment. it is possible
# for an environment to have multiple "children"

# the only environment without a parent is the empty environment

# a function + an environment = a closure, or function closure.


# if the value of a symbol is not found in the environment,
# in which a function was defined, then the search
# is continued in the parent environment

# the search continues down the sequence of parent environments
# until we hit the top-level environment. usually 
# the global environment(workspace), or the namespace of a package.

# after the top-level environment, the search continues
# down the search list until we hit the empty environment.
# if a value for a given symbol cannot be found once 
# the empty environment is arrived, it gives an error.








