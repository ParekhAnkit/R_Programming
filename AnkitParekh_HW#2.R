#################################################
#  Course     : CS 513-B
#  Project    : HW_2
#  Purpose    : Intro to R
#  First Name : Ankit
#  Last Name	: Parekh
#  Id			    : 10418787
#  Date       : 2/21/2017
#################################################

  ##Q 2.1 Create the following x and y vectors:
  ##      x=1,2,3
  ##      y=11,12,13,14,15,16
  ## Answer:
  
  x<-c(1,2,3)
  y<-c(11,12,13,14,15,16)
  
  ## Q 2.2 Calculate and display z=x+y
  ## Answer:
  
  z=x+y
  print(z)
  
  ## Q 2.3 Explain the results
  ## Answer:
  ## If two vectors are of unequal length, the shorter one will be reused in an orderly manner to match the longer vector.
  ## considering the above example, the following vectors x and y have different lengths, and their sum is computed by reusing the values of the shorter vector x.
  
  ## Q 2.4 Create a vector of your last name
  ## Answer:
  
  Last_Name<-c("Parekh")
  
  ## Q 2.5 Create a vector of your first name
  ## Answer:
  
  First_Name<-c("Ankit")
  
  ## Q 2.6 Create a vector of your Student ID
  ## Answer:
  
  student_Id<-c(10418787)
  
  ## Q 2.7 What are the length and data type of the "last name" vector? why?
  ## Answer:
  
  length(Last_Name)
  typeof(Last_Name)
  ## The length of "Last_name" is 1 because the vector "Last_name" holds only one element.
  ## Data type of "Last_name" is character since it holds a character string.
  
  ## Q 2.8 Combine your first name, last name and student id into a single vector ("myinfo").
  ## Answer:
  
  myinfo<-c(First_Name,Last_Name,student_Id)
  
  ## Q 2.9 Display "myinfo" on Console.
  ## Answer:
  
  myinfo
  
  ## Q 2.10 What are the length and data type of "myinfo"
  ## Answer:
  
  length(myinfo) #Length is 3
  typeof(myinfo) #type is character
  
  ## Q 2.11  Remove the "first_name" object.
  ## Answer:
  
  rm(First_Name)
  
  ## Q 2.12 Display "myinfo" in the Console again.
  ## Answer:
  
  myinfo
  
  ## Q 2.13 Create a dataframe "roster"  using the following table:
  ## First Last ID
  ## fname1   lname1   1111
  ## fname2   lname2   2222
  ## Answer:
  
  roster <- data.frame(First=c("fname1","fname2"),Last=c("lname1","lname2"),ID=c(1111,2222))
  
  ## Q 2.14 View the "roster".
  ## Answer:
  
  roster
  
  ## Q 2.15 Export the data frame "roster" to a csv file.
  ## Answer:
  
  write.csv(roster,file="roster.csv",row.names=FALSE)
  
  ## Q 2.16 Import and view the following csv file:        
  ## http://www.math.smith.edu/sasr/datasets/help.csv
  ## Answer:
  
  DataSet1 = read.csv(file="http://www.math.smith.edu/sasr/datasets/help.csv")
  DataSet1
  
  ## Q 2.17 Remove all the objects in your session.
  ## Answer:
  
  rm(list=ls())
  
