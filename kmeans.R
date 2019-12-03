#package to remove specified columns from dataframe
install.packages("dplyr");
library(dplyr);

#get cleaned data
cleaned_data <- readRDS(gzcon(url("https://raw.githubusercontent.com/segevm/Classifying-US-Kickstarter-Projects/master/datasets/cleaned_data.rds")));

#remove all columns except those that have continous variables
dat <- select(cleaned_data, "backers", "pledged", "goal", "duration");

#convert duration to num
dat$duration <- as.numeric(dat$duration, units="days");

#scaled the data
scaled_dat <- scale(dat);

#elbow chart
AveW<-NULL;
for (i in 1:10) { 
        AveW[i]<-mean(kmeans(scaled_dat,i)$withinss)
}
plot(1:10, AveW, xlab="number of clusters",ylab="average within-cluster sum of square");

#4 clusters appears to be good based on elbow chart

#k-means algorithm with k=4
k4<-kmeans(scaled_dat, centers = 4, nstart = 25);

##Profile plot##
#empty plot
plot(0,ylim=c(min(k4$centers),max(k4$centers)), xlim=c(0,4), xaxt="n")
#labels for x-axes
axis(1,at=1:4, labels=names(scaled_dat))
#line plot of the centroids
for(i in 1:4){
        lines(k4$centers[i,],col=i)
    
}
#adding cluster names
text(x=.5,y=k4$centers[,1], labels=paste("clusters",1:4))

#centroids
k4$centers

#attach cluster to dataset
dat$cluster <- as.factor(k4$cluster)

#reattach state
dat$state <- cleaned_data$state

#calculate by cluster membership
num <- aggregate(dat$state~dat$cluster,df,length)
names(num)[2] <- 'num'
successes <- aggregate(dat$state~dat$cluster,df,sum)
names(totalState)[2] <- 'successes'
merge(num,totalState)
