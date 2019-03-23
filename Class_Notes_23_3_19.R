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


# Swirl first R course Logic topic done. 8.ci ders galiba




