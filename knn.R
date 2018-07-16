#################################################
#  Purpose    : KNN
#  First Name : ANKIT
#  Last Name	: PAREKH
#################################################

## remove all objectes
rm(list=ls())
install.packages("class")
library(class)
?knn()

## Q1. Load the IRIS dataset
## Answer: 

data(iris) #load iris dataset
View(iris)

## Q2. Read the data and:
## Store every fifth record in a "test" dataset starting with the first record
## Store the rest in the "training" dataset
## Answer:

idx<-seq(from=1,to=nrow(iris),by=5) #store every 5th record in testdataset
View(idx)

test<-iris[idx,]
View(test)

training<-iris[-idx,] #store remaining record in training dataset
View(training)

## Q3. Use knn with k=1 and classify the test dataset
## Answer:

library(knn) #include library to use kknn function
knn1<-knn(training[,-5],test[,-5],training[,5],k=1)

## Q4. Measure the performance of knn
## Answer:

table(Predict=knn1,Actual=test[,5])

## Q5. Repeat the above steps with k=2, k=5, k=10
## Answer:

knn2<-knn(training[,-5],test[,-5],training[,5],k=2)
table(Predict=knn2,Actual=test[,5]) #Measure the performance of knn with k=2

knn5<-knn(training[,-5],test[,-5],training[,5],k=5)
table(Predict=knn5,Actual=test[,5]) #Measure the performance of knn with k=5

knn10<-knn(training[,-5],test[,-5],training[,5],k=10)
table(Predict=knn10,Actual=test[,5]) #Measure the performance of knn with k=10
