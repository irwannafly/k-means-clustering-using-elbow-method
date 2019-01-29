x<-read.csv("https://raw.githubusercontent.com/irwannafly/k-means-clustering-using-elbow-method/master/elbow.csv", sep = ",")
head(x,5)
x<-x[-1]
x<-x[-2]
x$X1........... <- gsub("]","",x$X1...........)
library(stringr)
x$X1........... <- str_trim(x$X1...........)
tail(x,5)

x$X1........... <- gsub("  "," ",x$X1...........)
library(tidyr)
x <- separate(x, col = X1..........., into = c("x1","x2"), sep = " " )
x$x1 <- as.numeric(x$x1)
x$x2 <- as.numeric(x$x2)
wss <- 0
for (i in 1:15) {
  km.out <- kmeans(x, centers = i, nstart = 20)
  wss[i] <- km.out$tot.withinss
}
plot(1:15, wss, type = "b", 
     xlab = "Number of Clusters", 
     ylab = "Within groups sum of squares")
