# DATES and TIMES

#dates are represented by the Date Class

# Times are represented by the POSIXct or the 
# POSIXlt class

# dates are stored internally as the number of
# dates since 1970-01-01

#times are stored internally as the number 
# of seconds since 1970-01-01

x <- as.Date("1970-01-01")

unclass(x <- as.Date("1970-01-02"))
#gives out 1 because it's one day after 1970-01-01

# POSIXct is just a very large integer under the hood

#a useful class when you want to store times in 
# something like a data frame

# POSIXlt is a list underneath and it stores a bunch
# of other useful information like the day of the week
# day of the year, month and day of the month

# number of generic functions:

#weekdays, months, quarters

x <- Sys.time()

p <- as.POSIXlt(x)

names(unclass(p))

unclass(x)

#gives out the POSIXct integer

# if you want the list format, you have to convert
# to POSIXlt format


#strptime function in case your dates are written
# in a different format


datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
#look for help page of strptime for %values

#date objects keep in consideration leap years and leap times



#as.Date
#as.POSIXlt
#as.POSIXct

# difftime() is a more controlled way of getting difference

# logical order
#arithmetic operands
# AND operator before OR operands

# which() returns TRUE cases 
ints <- sample(10)

which(ints > 7)






