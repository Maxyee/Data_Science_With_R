# 2. K-means++
# ----------------
install.packages("LICORS")
library("LICORS")

kmpp.cl <- kmeanspp(iris[,1:4], k = 3)
plot(iris[,1:2], col = kmpp.cl$cluster, pch = as.character(kmpp.cl$cluster), cex = 0.7, main="k-means++")
points(kmpp.cl$centers[,c(1,2)], pch = as.character(1:3), cex = 3, lwd=3)
table(kmpp.cl$cluster, iris$Species)
