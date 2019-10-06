# 3. K-medoids
# ----------------
# install.packages("cluster")
library("cluster")
# pam(x, k, diss = FALSE, metric = "euclidean", stand = FALSE)
# kmed.cl <- pam(iris[,1:4], k = 3)
kmed.cl <- pam(iris[,1:4], k = 3, metric = "manhattan")
plot(iris[,1:2], col = kmed.cl$clustering, pch = as.character(kmed.cl$clustering), cex = 0.7, main="k-medoids")
points(kmed.cl$medoids, pch = c("1","2","3"), cex = 2, lwd=3)
table(kmed.cl$clustering, iris$Species)

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



# 5. Jaccard distance
# distance between binary vectors (0 and 1)
# ------------------------------------------
install.packages("proxy")
library("proxy")


set.seed(137)
df <- rbind(matrix(rbinom(250, 1, 0.25), ncol = 5), matrix(rbinom(250, 1, 0.75), ncol = 5))
colnames(df) <- c("A", "B", "C", "D", "E")
head(df)

# set.seed(101)
# samples <- sample(c(FALSE, TRUE), 8, rep = TRUE)
# x <- matrix(samples, ncol = 2)
# dist(x, method = "Jaccard")

j_dist <- dist(df, method = "Jaccard")
kmed.cl.j <- pam(j_dist, k = 3, diss = TRUE)
medoids <- df[kmed.cl.j$id.med,]
plot(jitter(df), col = kmed.cl.j$clustering, main="kmedoid with jaccard")
points(medoids, col = 1:3, pch = c("1","2","3") , cex=3, lwd=3)

