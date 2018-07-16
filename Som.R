#################################################
#  Purpose    : SOM
#  First Name : ANKIT
#  Last Name	: PAREKH
#################################################

## Step 0 clean up!!!
rm(list=ls())

library(kohonen)

b_cancer<-read.csv("C:/Users/Hp-Pc/Downloads/kddass9/kddass9/wisc_bc_data.csv")

mnorm<-function(x)
{ minx<-min(x)
maxx<-max(x)
z<-((x-minx)/(maxx-minx))
return(z)
}

for(i in 3:ncol(b_cancer))
{b_cancer[,i]<-mnorm(b_cancer[,i])}

b_cancer_data<-b_cancer[,3:32]

b_cancer_datamatrix <- as.matrix((b_cancer_data))

set.seed(100)

som_model<-som(b_cancer_datamatrix,grid=somgrid(2,1))
som_model$unit.classif

output<-table(Actual=as.numeric(b_cancer$diagnosis),SOM_Cluster=som_model$unit.classif)

accuracy<-sum(diag(output))/sum(output)
print(accuracy)
