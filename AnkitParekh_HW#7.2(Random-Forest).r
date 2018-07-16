#################################################
#  Company    : Stevens
#  Course     : CS 513-B
#  Project    : HW#7.2
#  Purpose    : Random Forest
#  First Name : ANKIT
#  Last Name  : PAREKH
#  Id         : 10418787
#  Date       : 04/25/2017
#################################################
# Step 0 cleaning


rm(list=ls())

library(randomForest)

b_cancer<-read.csv("C:/Users/shrin/Downloads/Ankit_HW/breast-cancer-wisconsin_cat_data.csv")

set.seed(123)

b_cancer$F1<-as.factor(b_cancer$F1)
b_cancer$F2<-as.factor(b_cancer$F2)
b_cancer$F3<-as.factor(b_cancer$F3)
b_cancer$F4<-as.factor(b_cancer$F4)
b_cancer$F5<-as.factor(b_cancer$F5)
b_cancer$F7<-as.factor(b_cancer$F7)
b_cancer$F8<-as.factor(b_cancer$F8)
b_cancer$F9<-as.factor(b_cancer$F9)
b_cancer$diagnosis<-as.factor(b_cancer$diagnosis)

index <- seq (1,nrow(b_cancer),by=5)
test<-b_cancer[index,]
train<-b_cancer[-index,]

fit <- randomForest( diagnosis~F1+F2+F3+F4+F5+F6+F7+F8+F9, data=b_cancer, importance=TRUE, ntree=2000)
importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test)
table(actual=test[,11],Prediction)

table(actual=test[,4],Prediction )
wrong<- (test[,11]!=Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate 

#F2 - Uniformity of Cell Size, 
#F6 - Bare Nuclei and 
#F3 - Uniformity of Cell Shape
#Are the top 3 important features concluded by observing MeanDecreaseAccuracy and MeanDecreaseGini plots.
