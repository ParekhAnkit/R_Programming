#################################################
#  Purpose    : HIerarchial Clustering
#  First Name : ANKIT
#  Last Name  : PAREKH
#################################################


rm(list=ls())

#Creating vectors x and y 
x <- c(7,10,13,21,28,28,35,43,44,50)
y <- c(57,62,63,71,78,88,89,90,94,98)

#Binding x and y
xy <-cbind(x,y)

#Calculating the distance
distxy <- dist(xy)
class(distxy)

#Using hierarchical cluster and plot the dendogram
hxy<-hclust(distxy)
plot(hxy, main = "Hierarchical Clustering")

#Using hierarchical clustering with average method and plot the dendogram
hxy1 <- hclust(distxy, method = "average")
plot(hxy1, main = "Hierarchical Cluster (Average)")

#labelings
labl <- c('A','B','C','D', 'E', 'F', 'G','H','I', 'K')

#Plotting the dendogram with labels
plot(hxy1, labels = labl, main = "Hierarchical Clustering (Average)")
