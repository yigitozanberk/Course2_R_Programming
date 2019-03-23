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








