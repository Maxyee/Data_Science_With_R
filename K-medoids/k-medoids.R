# 3. K-medoids
# ----------------
install.packages("cluster")
library("cluster")

# pam(x, k, diss = FALSE, metric = "euclidean", stand = FALSE)
# kmed.cl <- pam(iris[,1:4], k = 3)

kmed.cl <- pam(iris[,1:4], k = 3, metric = "manhattan")
plot(iris[,1:2], col = kmed.cl$clustering, pch = as.character(kmed.cl$clustering), cex = 0.7, main="k-medoids")
points(kmed.cl$medoids, pch = c("1","2","3"), cex = 2, lwd=3)
table(kmed.cl$clustering, iris$Species)

#print(iris[,1:2])


# plot function in cluster package
plot(kmed.cl, main = "Clustering Information")

# average silhouette value
kmed.cl$silinfo$avg.width



# ruspini data
data(ruspini)
plot(pam(ruspini, k = 4), main="Ruspini Data")


# pam is slow when dataset is large
# so often clara() is used
kmed.clara <- clara(iris[,1:4], k = 3, metric = "manhattan")
plot(iris[,1:2], col = kmed.clara$clustering, pch = as.character(kmed.clara$clustering), cex = 0.7)
points(kmed.clara$medoids, pch = c("1","2","3"), cex = 2, lwd=3)

table(kmed.clara$clustering, iris$Species)
