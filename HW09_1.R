#################################################
#  Company    : Stevens
#  Course     : CS 513-B
#  Project    : HW#9
#  Purpose    : Neuralnet and SOM
#  First Name : ANKIT
#  Last Name	: PAREKH
#  Id			    : 10418787
#  Date       : 05/03/2017
#################################################

## Step 0 clean up!!!
rm(list=ls())

library("neuralnet")

#reading in the file
b_cancer<-read.csv("C:/Users/Hp-Pc/Downloads/kddass9/kddass9/wisc_bc_data.csv")

#function for normalising the data
mnorm<-function(x)
{ minx<-min(x)
maxx<-max(x)
z<-((x-minx)/(maxx-minx))
return(z)
}

#normalising the data
for(i in 3:ncol(b_cancer))
{b_cancer[,i]<-mnorm(b_cancer[,i])}

#changing the target column to numeric from categorical
b_cancer$diagnosis<-as.numeric(b_cancer$diagnosis)

#creating the training and test datasets
index <- seq (1,nrow(b_cancer),by=5)
test<-b_cancer[index,]
training<-b_cancer[-index,]

#running neural net on training dataset and using a selected set of predictors, hidden layer = 10, learning rate = 0.05
net.diagnosis <- neuralnet(diagnosis~radius_mean+radius_se+radius_worst+texture_mean+texture_se+texture_worst+perimeter_mean+perimeter_se+perimeter_worst, training, hidden=10, threshold=0.05)

print(net.diagnosis)

plot(net.diagnosis)

#creating test dataset with the selected predictors
test_data<-cbind(test$radius_mean,test$radius_se,test$radius_worst,test$texture_mean,test$texture_se,test$texture_worst,test$perimeter_mean,test$perimeter_se,test$perimeter_worst)
test_data<-as.data.frame(test_data)

#computing output for test dataset
net.results <- compute(net.diagnosis, test_data)

str(net.results)

print(net.results$net.result)

#converting neural net output from numeric to categorical
results<-as.data.frame(net.results$net.result)
results$diagnosis_neural <- ifelse(results$V1>1.5,2,1)

#creating output set with predictors, actual results and neural net results
cleanoutput <- cbind(test_data,test$diagnosis,results$diagnosis_neural)

print(cleanoutput)

View(cleanoutput)

#tabulating the actual outputs and neural net outputs
output<-table(Actual=cleanoutput$`test$diagnosis`,NeuralNetOutput=cleanoutput$`results$diagnosis_neural`)

#calculating the accuracy
accuracy<-sum(diag(output))/sum(output)
print(accuracy)