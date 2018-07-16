#################################################
#  Company    : Stevens
#  Course     : CS 513-B
#  Project    : HW#3
#  Purpose    : Explore and Clean
#  First Name : ANKIT
#  Last Name	: PAREKH
#  Id			    : 10418787
#  Date       : 03/20/2017
#################################################


## remove all objectes
rm(list=ls())


## Q1. Load the following CSV file to your R environment: http://www.math.smith.edu/sasr/datasets/help.csv
## Answer:

my.dataset<-read.csv("http://www.math.smith.edu/sasr/datasets/help.csv")
View(my.dataset)
## Q2. Using the above file perform the following, Create a dataframe of: id, pcs1, mcs1, substance, and race group
## Answer:

my.DataFrame<-data.frame(c(my.dataset["id"],my.dataset["pcs1"],my.dataset["mcs1"],my.dataset["substance"],my.dataset["racegrp"]))


## Q3. Calculate: Mean, Max, STD, Max, Min of mcs1
## Answer:

mean(my.dataset[,6]) # With NA
mean(my.dataset[,6],na.rm=TRUE) # Without NA

max(my.dataset[,6]) # With NA
max(my.dataset[,6],na.rm=TRUE) # Without NA

sd(my.dataset[,6]) # With NA
sd(my.dataset[,6],na.rm=TRUE) # Without NA

min(my.dataset[,6]) # With NA
min(my.dataset[,6],na.rm=TRUE) # Without NA


## Q4. Create a frequency  table of substance vs. racegroup
## Answer:

freqtable<-table(my.dataset$substance,my.dataset$racegrp)
View(freqtable)

## Q5. Substitute the missing values of mcs1 by the overall average
## Answer:

mean(my.dataset[,6],na.rm=TRUE)
my.dataset$mcs1[is.na(my.dataset[,6])]<-round(mean(my.dataset[,6],na.rm=TRUE))
View(my.dataset)