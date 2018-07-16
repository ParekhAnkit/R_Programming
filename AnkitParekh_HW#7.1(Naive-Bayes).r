#################################################
#  Company    : Stevens
#  Course     : CS 513-B
#  Project    : HW#7.1
#  Purpose    : Naive Bayes
#  First Name : ANKIT
#  Last Name  : PAREKH
#  Id         : 10418787
#  Date       : 04/25/2017
#################################################


rm(list=ls())

install.packages('e1071', dependencies = TRUE)

library(class) 
library(e1071)

b_cancer<-read.csv("C:/Users/shrin/Downloads/Ankit_HW/breast-cancer-wisconsin_cat_data.csv")

b_cancer$F1<-as.factor(b_cancer$F1)
b_cancer$F2<-as.factor(b_cancer$F2)
b_cancer$F3<-as.factor(b_cancer$F3)
b_cancer$F4<-as.factor(b_cancer$F4)
b_cancer$F5<-as.factor(b_cancer$F5)
b_cancer$F7<-as.factor(b_cancer$F7)
b_cancer$F8<-as.factor(b_cancer$F8)
b_cancer$F9<-as.factor(b_cancer$F9)
b_cancer$diagnosis<-as.factor(b_cancer$diagnosis)

# Naive Bayes classification with all variables 
nBayes_all <- naiveBayes(diagnosis ~., data=b_cancer)
category_all<-predict(nBayes_all,b_cancer)
View(category_all)

table(NBayes_all=category_all,diagnosis=b_cancer$diagnosis)

# error rate: 18 / 699 = 2.6%

