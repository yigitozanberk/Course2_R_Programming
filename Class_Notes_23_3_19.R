# SWIRL NOTES

# install.packages("swirl")

# Every time you want to use swirl, you need to load
# it to your library.

# library(swirl)

# install_from_swirl("R Programming")

# swirl()

# rm(list=ls()) to remove and clear the workspace

#| You can exit swirl and return to the R prompt (>) at
#| any time by pressing the Esc key. If you are already
#| at the prompt, type bye() to exit and save your
#| progress. When you exit properly, you'll see a short
#| message letting you know you've done so.

#| When you are at the R prompt (>):
# | -- Typing skip() allows you to skip the current
#| question.
#| -- Typing play() lets you experiment with R on your
#| own; swirl will ignore what you do...
#| -- UNTIL you type nxt() which will regain swirl's
#| attention.
#| -- Typing bye() causes swirl to exit. Your progress
#| will be saved.
#| -- Typing main() returns you to swirl's main menu.
#| -- Typing info() displays these options again.

15:1 # gives a vector of number descending from 15 to 1 

# to get help from R, use ?function_name_here
# for operators you need single quotes ?':'

# seq(0,10, by=0.5)
# seq(5,10, length = 30)

# rep(0, times=40)

# rep(c(0,1,2), each =10)

# an 'atomic vector' contains only one data type

# numeric, logical, character, integer, and complex

#The `<` and `>=` symbols in these examples are called
#| 'logical operators'. Other logical operators include
#| `>`, `<=`, `==` for exact equality, and `!=` for
# | inequality.


#| If we have two logical expressions, A and B, we can
#| ask whether at least one is TRUE with A | B (logical
#                                               | 'or' a.k.a. 'union') or whether they are both TRUE
#| with A & B (logical 'and' a.k.a. 'intersection').
#| Lastly, !A is the negation of A and is TRUE when A is
#| FALSE and vice versa.

#my_char <- c("My", "name", "is")

# paste(my_char, collapse= " ")

# paste(LETTERS, 1:4, sep="-") 

# R recycles the shorter vector

#my_data == NA
#[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[36] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[71] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

#| The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a
#| quantity that is not available. Therefore the logical expression is incomplete and R has no choice but to
#| return a vector of the same length as my_data that contains all NAs.

# while using NAs, you don't test logical comparisons. NA is bulasici. when it gets into a logical comparison,
# the yield is NA no matter what you're comparing it with because R doesn't know what to do

# x[is.na(x)] gives you all the NA values in the x

# y <- x[!is.na(x)] gives you all the non-NA values in x

# y[y>0] gives you values of y greater than 0

# if you don't clean NAs first, they will corrupt your study. NA > 0 evaluates as NA again.

# x[!is.na(x) & x > 0] can be used as well

# R doesn't use zero-based indexing. R uses one-based indexing. 

# NEGATIVE INDEXES


#| Luckily, R accepts negative integer indexes. Whereas x[c(2, 10)] gives us ONLY the 2nd and 10th elements of
#| x, x[c(-2, -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements.  Try x[c(-2, -10)] now to
#| see this.


# ADDIND A COLUMN TO A MATRIX

#| Now we'll use the cbind() function to 'combine columns'. Don't worry about storing the result in a new
#| variable. Just call cbind() with two arguments -- the patients vector and my_matrix.

# !5 == 7
# TRUE

#| As you may recall, arithmetic has an order of operations and so do logical expressions. All AND operators
#| are evaluated before OR operators. Let's look at an example of an ambiguous case. Type: 5 > 8 || 6 != 8 &&
#| 4 > 3.9

#> 5 >8 || 6 != 8 && 4 > 3.9
#[1] TRUE

#| That's the answer I was looking for.

#  |==========================================================                                          |  58%
#| Let's walk through the order of operations in the above case. First the left and right operands of the AND
#| operator are evaluated. 6 is not equal 8, 4 is greater than 3.9, therefore both operands are TRUE so the
#| resulting expression `TRUE && TRUE` evaluates to TRUE. Then the left operand of the OR operator is
#| evaluated: 5 is not greater than 8 so the entire expression is reduced to FALSE || TRUE. Since the right
#| operand of this expression is TRUE the entire expression evaluates to TRUE.

######3


# Swirl first R course Logic topic done. 8.ci ders 

###### 9 - Functions


#| Congratulations on writing your first function. By writing functions, you can gain serious insight into how
#| R works. As John Chambers, the creator of R once said:
#  | 
#  | To understand computations in R, two slogans are helpful: 1. Everything that exists is an object. 2.
#| Everything that happens is a function call.

#| With all of this talk about arguments, you may be wondering if there is a way you can see a function's
#| arguments (besides looking at the documentation). Thankfully, you can use the args() function! Type:
#| args(remainder) to examine the arguments for the remainder function.



# You can pass functions as arguments to other functions just like you can pass
# data to functions. Let's say you define the following functions:
#
# add_two_numbers <- function(num1, num2){
#    num1 + num2
# }
#
# multiply_two_numbers <- function(num1, num2){
#	num1 * num2
# }
#
# some_function <- function(func){
#    func(2, 4)
# }
#
# As you can see we use the argument name "func" like a function inside of 
# "some_function()." By passing functions as arguments 
# some_function(add_two_numbers) will evaluate to 6, while
# some_function(multiply_two_numbers) will evaluate to 8.
# 
# Finish the function definition below so that if a function is passed into the
# "func" argument and some data (like a vector) is passed into the dat argument
# the evaluate() function will return the result of dat being passed as an
# argument to func.
#
# Hints: This exercise is a little tricky so I'll provide a few example of how
# evaluate() should act:
#    1. evaluate(sum, c(2, 4, 6)) should evaluate to 12
#    2. evaluate(median, c(7, 40, 9)) should evaluate to 9
#    3. evaluate(floor, 11.1) should evaluate to 11

evaluate <- function(func, dat){
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
}


#> evaluate(function(x){x+1}, 6)
#[1] 7
#
#| All that hard work is paying off!
#  
#  |=================================================================                                   |  65%
#  | The first argument is a tiny anonymous function that takes one argument `x` and returns `x+1`. We passed
#  | the number 6 into this function so the entire expression evaluates to 7.




# Let's explore how to "unpack" arguments from an ellipses when you use the
# ellipses as an argument in a function. Below I have an example function that
# is supposed to add two explicitly named arguments called alpha and beta.
# 
# add_alpha_and_beta <- function(...){
#   # First we must capture the ellipsis inside of a list
#   # and then assign the list to a variable. Let's name this
#   # variable `args`.
#
#   args <- list(...)
#
#   # We're now going to assume that there are two named arguments within args
#   # with the names `alpha` and `beta.` We can extract named arguments from
#   # the args list by using the name of the argument and double brackets. The
#   # `args` variable is just a regular list after all!
#   
#   alpha <- args[["alpha"]]
#   beta  <- args[["beta"]]
#
#   # Then we return the sum of alpha and beta.
#
#   alpha + beta 
# }
#
# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
  # Do your argument unpacking here!
  
  args <- list(...)
  
  place <- args [["place"]]
  adjective <- args[["adjective"]]
  noun <- args [["noun"]]
  
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}










# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!
#
# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.
# 
# Let's say I wanted to define a binary operator that multiplied two numbers and
# then added one to the product. An implementation of that operator is below:
#
# "%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
#   left * right + 1
# }
#
# I could then use this binary operator like `4 %mult_add_one% 5` which would
# evaluate to 21.
#
# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(left, right){ # Remember to add arguments!
  paste(left,right)
}


# 26 /3 /19

# typically, a function is defined in the global environment

# so that the values of free variables are
# just found in the user's workspace

# however, in R you can have functions defined
# inside other functions.


# HOW TO MAKE A DOUBLE LAYERED FUNCTION

make.power <- function(n) {
  pow<- function(x){
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)

# now square() takes the square of the given number


y<- 10

f<- function(x){
  y<- 2
  y^2 + g(x)
}

g<-function(x){
  x*y
}

f(3) #will give out 34. y value inside f() is 2. 
#but y value inside g() is 10.


#consequences of lexical scoping

# in Rm all objects must be stored in memory.

#all functions must carry a pointer to their respective
# defining environments, which could be anywhere



# OPTIMIZATIONS

# few optimization routines
# optim, nim, optimize

#require you to pass a function whose argument is 
# a vector of parameters

# NOTE: Optimization functions in R
# minimize functions, so you need to use the negative
# log-likelihood.

make.NegLogLik <- function(data, fixed =c(FALSE, FALSE)) {
  # second argument determines if I want to fix
  # some parameters
  params <- fixed
  function(p){
    params[!fixed] <- p # the parameter I want to optimize
    mu <- params[1]
    sigma <- params[2]
    a<- -0.5*length(data)*log(2*pi*sigma^2)
    b<- -0.5*sum((data-mu)^2)/ (sigma^2)
    -(a + b)
  } # returns the function as a return value
}
#returns log likelihood of a normal distribution
# mean = mu
# standard deviation = sigma

#simulate normal random variables
set.seed(1); normals <- rnorm(100,1,2) #100 variables
# mean = 1, sd = 2
nLL <- make.NegLogLik(normals)

ls(environment(nLL))

# nLL knows the data variable, because it was defined
# with the nLL <- make.NegLogLik(normals) command

# it is in the environment in which the nLL function was created

#> optim(c(mu = 0, sigma = 1), nLL)$par
#mu    sigma 
#1.218239 1.787343

# fixing sigma = 2

nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1,3))$minimum # here I can call optimize
# because optimize will minimize the value of a single variable only
# [1] 1.217775

# fixing mu = 1

nLL<- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum
# [1] 1.800596


#plotting the likelihood

nLL <- make.NegLogLik(normals, c(1, FALSE))
x<- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y -min(y))), type = "l")

nLL <- make.NegLogLik(normals, c(FALSE, 2))
x<- seq(0.5, 1.5, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y -min(y))), type = "l")


#this type of lexical scoping use is very 
# useful for exploratory work on data.

# you don't have to tell where the data is 
# to the function everytime you use it.

# you specify the data with one code, and explore
# with different variables and different plots


# CODING STANDARDS

# very important to understand the code. 
# it's a discipline.

#1. always write your code in a text editor
# and save as text.

#2. indent your code. at least 4, 8 spaces ideal

#3.limit the width of your code(80 columns)
# except exceptions, more than two nested for loops
# is not necessary and should be avioded

#4.limit the length of the functions
# every function should do one basic activity
# you can then trace your functions.
# it's MUCH easier to debug. debugging biyatch.









