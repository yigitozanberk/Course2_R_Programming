# 20/3/2019

# ordered- unordered factors
# factors represent categorical data

#factors are treated specially by modelling functions
# like lm() and glm()

#using factors with labels is better than using integers
#because factors are self-describing

# male female is better than 1 and 2

x <- factor(c("yes", "yes", "no", "yes", "no"))

table(x)

unclass(x)


x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))

#if you don't describe factors, R automatically
# assigns them alphabetically

unclass(x) #reversed leveling

# MISSING VALUES

is.na() #is used to test objects if they are NA

is.nan() # is used to test for NaN

# NaN is used for undefined mathematical operations

# NaN value is also NA but the converse is not true

# NA values can have class too. But they are still
# NA...

x <- c(1, 2, NaN, NA, 4)

is.na(x)

is.nan(x)

# DATA FRAMES

# data frames are used to store tabular data

# they are represented as a special type of list

# for the data to be tabular, the columns have to have
# the same length. so

# data frames are a special type of list where every 
# element of the list has to have the same length

# every row has a name
# data frames are usually created by read.table()
# or read.csv()

# can be converted to a matrix by calling data.matrix()
# you can't if you have a data frame with many types of 
# objects.

x <- data.frame( foo= 1:4, bar = c( T,T, F,F))
nrow(x) #number of rows of x
ncol(x) #number of columns of x

# objects can also have names

x <- 1:3

names(x) #there are no names of elements yet

names(x) <- c( "foo", "bar", "norf") # now elements
 # have names
x # as you can see

x <- list( a= 1, b= 2, c=3) #here all elements have
# names

m <- matrix (1:4, nrow=2, ncol=2)
dimnames(m) <- list( c("a", "b"), c("c", "d"))
# first vector is row names, second vector col names
m

# very useful to create a matrix with row col names

# Reading and Writing Data in R
#read.table() , read.csv() for reading tabular data

#readLines for reading lines of text file

# source, for reading in R code files, inverse of dump
# dget, for reading R code files, inverse of dput
# load, for reading saved workspaces,
# unserialize, for reading single R objects in binary

# write.table()
# writeLines
# dump
# dput
# save
# serialize

# read.table is important, below the important arguments

# file, name of the file
# header, logical indicating if first line is heading line
# sep, a string indicating how the columns are separated, commas, semicolons, tabs, spaces
# colClasses, a character vector indicating the class
# of each column in the dataset. first column numeric
# second colum string
# nrows, number of rows, not required usually
# comment.char, a character string indicating comment character
# skip, the number of lines to skip from beginning
# stringsAsFactors, should character variables be coded 
# as factors?
# do you wanna encode caracter variables as factors?


#for small datasets you may not have to use the arguments

# data<- read.table("foo.txt")

# R will automatically

# skip lines that begin with a #
# figure out how many rows there are (and how much memory
# needs to be allocated)
# figure what type of variable is in each column of the table
# telling R all these things directly makes R run
# faster and more efficiently
# read.csv is identical to read.table except that the
# default separator is a comma. in read.table 
# default separator is space

# read.csv always specifies the header to be TRUE


# READING LARGE DATA SETS

# read the help page for read.table
# make a rough calculation of the memory required 
# to store your dataset
# if dataset is larger than the amount of RAM on your
# computer, you can probably stop right here.
# set comment.char = "" if there are no commented
# lines in your file

#colClasses is very important. if you don't specify it
# it goes through every column. VERY IMPORTANT

#tell R what type of data is at every column
# if all columns are same colClasses = "numeric"
# quick and dirty way - using the first 100 rows of data

# initial <- read.table("datatable.txt", nrows = 100)
# classes <- sapply(initial, class)
# tabAll <- read.table("datatable.txt", colClasses = classes)

# sapply loopes over each column
# class function will tell you what class is in each 
# column. 

#you can use the Unix tool wc to calculate the number of 
# rows of the file

# for LARGE DATA SETS

# how much memory is available in computer
# what other applications are in use
# are there other users logged into the same system
# what operating system
# is the OS 32 or 64 bit?

# on 64 bit, you'll be able to access more memory

# calculating memory requirements

# for 1.500.000 rows, and 120 columns with numeric

# 1.500.000 x 120 x 8 bytes/numeric

# = 1440000000 bytes
# = 1440000000/ 2 ^30 bytes/MB
# = 1.373,29 MB
# = 1.34 GB

# you need twice RAM to read and execute effectively
# this computer has 4 GB ram. so, 2 GB memory is max
# to work effectively.

# TEXTUAL DATA FORMATS dput() and dump()

# dumping and dputing are useful 
# because the textual format is edit-able, and in the 
# case of corruption, potentially recoverable

# they contain more metadata, while sacrificing
# readability
# ex. it stores class of each column

# textual formats can work much better with
# version control programs like subversion or git
# which can only track changes meaningfully
# in text files, rather than binary data
# downside, the format is not space-efficient
# it often need to be compressed

y <- data.frame( a= 1, b = "a")
dput(y)
 dput(y, file = "y.R")
 new.y <- dget("y.R")
 new.y

# dump function is like dget but dget can only be used
 # on a single R object.
 
x <- "foo"
y <- data.frame(a=1 , b= "a")

dump(c("x", "y"), file= "data.R") #dumps as text file

rm(x,y) #remove current x, y from environment

source("data.R") # successfully re-loads data from data.R

y
x

# CONNECTIONS

# data are read in using connection interfaces.

# file, opens a connection to a file
# gzfile, opens a connection to a file
#compressed with gzip
# bzfile, opens a connection to a file 
#compressed with bzip2
# url, opens a connection to a webpage

# str(file) for arguments **********************

# function (description = "", open = "", blocking = TRUE, 
# encoding = getOption("encoding"), raw = FALSE, 
# method = getOption("url.method", "default"))  

# description, is the name of the file
# open, is a code indicating:
# "r" read only
# "w" writing (and initializing a new file)
# "a" appending
# "rb", "wb", "ab" reading, writing, or appending
# in binary mode( Windows)


# con <- file ("foo.txt", "r")
# data <- read.csv(con)
# close(con)

# is the same as 
# data <- read.csv("foo.txt")

# if you want to read parts of a file, connections are
# very useful

# con <- gzfile("words.gz")
# x <- readLines(con, 10)
# x  gives the first 10 lines of the file

# writeLines is similar

# possible for url
# con <- url("https://www.jhsph.edu", "r")
# x <- readLines(con)
# head(x)

#







