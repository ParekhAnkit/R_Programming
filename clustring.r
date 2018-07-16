#################################################
#  Purpose    : Classify(Clustering)
#  First Name : ANKIT
#  Last Name  : PAREKH
#################################################


rm(list=ls())


churn_data <- read.csv("C:/Users/shrin/Downloads/Ankit_HW/churn.csv")

churn<-churn_data

View(churn)
attach(churn)

#Normalize function
normalize <- function(x){
  return((x - min(x)) / (max(x)-min(x)))
}

#Convert international and Voicemail plan to numeric values
in_plan <- ifelse(churn$Int.l.Plan=="yes",1,0)
View(in_plan)
vmail_plan <- ifelse(churn$VMail.Plan=="yes",1,0)
View(vmail_plan)

#Normalize customer service calls
cust_serv_calls <-normalize(churn$CustServ.Calls)
View(cust_serv_calls)

#create a data frame for the required variables
newdata <- data.frame(in_plan, vmail_plan, cust_serv_calls)
View(newdata)

# Use k-means algorithm to cluster the data
clust <- kmeans(newdata,3)
clust


table(newdata$in_plan,col=clust$cluster)
table(newdata$vmail_plan,col=clust$cluster)
table(newdata$cust_serv_calls,col=clust$cluster)

clust$cluster

#Plot the data in a graph
plot(newdata[c("in_plan","cust_serv_calls")], col=clust$cluster)
plot(newdata[c("vmail_plan","cust_serv_calls")], col=clust$cluster)



#------------------------different Method------------------
View(churn_data)
str(churn_data)

churn_data$Int.l.Plan <- as.integer(churn_data$Int.l.Plan)
churn_data$Int.l.Plan[churn_data$Int.l.Plan == "2"] <- 0

churn_data$VMail.Plan <- as.integer(churn_data$VMail.Plan)
churn_data$VMail.Plan[churn_data$VMail.Plan == "2"] <- 0

mnorm <- function(x, minx, maxx) {
  return ((x-minx)/(maxx-minx))
}

norm_churn_data <- mnorm(churn_data$CustServ.Calls,min(churn_data$CustServ.Calls),max(churn_data$CustServ.Calls))
new_churn_data <- c(churn_data$Int.l.Plan,churn_data$VMail.Plan,norm_churn_data)

?attitude()
?kmeans()
data_cluster <- kmeans(new_churn_data, 3, nstart = 20)

# output:
# K-means clustering with 3 clusters of sizes 5456, 3123, 1420
                      
