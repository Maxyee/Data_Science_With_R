#k-means
#----------
#km.out <- kmeans(x, centers = 3, nstart = 1, iter.max = 20)


x1 <- rnorm(n = 200, mean = 3, sd = 1)
x2 <- rnorm(n = 200, mean = 4, sd = 1)
x3 <- rnorm(n = 200, mean = 6, sd = 1)
x4 <- rnorm(n = 200, mean = 7, sd = 1)


db <- as.data.frame(rbind(cbind(x1,x2), cbind(x3,x4)))
plot(db, pch = 20)

#db <- as.data.frame(cbind(x1, x2))
#plot(db, pch = 20)


km_cl <- kmeans(db, centers = 2, nstart = 5)
str(km_cl)

# clusters assigned to each point
km_cl$cluster

# total sum of squares
print(km_cl$totss)


# within-cluster sum of squares
print(km_cl$withinss)

# total within_cluster sum of squares
print(km_cl$tot.withinss)

# between-cluster sum of squares
print(km_cl$betweenss)

# or simply
print(km_cl$totss - km_cl$tot.withinss)


# size of cluster (number of points in each cluster)
print(km_cl$size)


plot(db, col = ifelse(km_cl$cluster == 1, "red","blue"), pch = 20, main = "K-means")
points(km_cl$centers, col = c("red","blue"),  pch = 10, cex = 4, lwd = 4)


data(iris)
head(iris)
table(iris$Species)

# number of centers (K) heruristic
# elbow method


# always standardize data before clustering
iris[,1:4] <- scale(iris[,1:4])

within_ss <- numeric(6)

for(i in 1:6){
  km.cl <- kmeans(iris[,1:4], centers = i, nstart = 10)
  print(paste("K:",i," ==> total within ss:",km.cl$tot.withinss))
  within_ss[i] <- km.cl$tot.withinss
}

# plot number of centers Vs. total within SS
plot(x = 1:6, y = within_ss, type='b', xlab = "K", ylab = "total within SS" )



# comparing the clustering with 3 centers, with class labels
par(mfrow = c(1,2))
km.cl <- kmeans(iris[,1:4], centers = 3, nstart = 20)


# plotting points with assigned clusterse
plot(iris[,1:2],  pch = as.character(km.cl$cluster), cex = 0.7, main="clustering")


# plotting points with original class labels
plot(iris[,1:2], pch = as.numeric(iris$Species), main = "class labels")
par(mfrow = c(1,1))

table(km.cl$cluster, iris$Species)


# silhouette() function from "cluster" package
# can be used to calculate average silhouette value
# it is a measure of how similar an object is to its own cluster
# compared to other clusters

library("cluster")
distance_matrix <- dist(iris[,1:4], method = "euclidean")
# print(dist(iris[1:4,1:4], method = "euclidean"))

sil <- silhouette(km.cl$cluster, dist = distance_matrix)
average_silhouette_val <- mean(sil[,3])
print(average_silhouette_val)
