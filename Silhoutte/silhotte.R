# CLUSTERING EVALUATION
# ------------------------------------------------

data(iris)
head(iris)
table(iris$Species)



# External Evaluation
# --------------------
km.cl <- kmeans(iris[,1:4], centers = 3, nstart = 10)
# purity
# Each cluster is assigned to a class that is most frequent

class_label <- iris$Species
a = table(cluster = km.cl$cluster, class = class_label)
print(a)
apply(a, 1, max)
sum(apply(a, 1, max))/sum(a)


# simple and intuitive
# disadvantage: each object to its own cluster, purity 1

# Adjusted Rand Index (-1 to 1)
# measures percentage of correct decision taken, given a pair, is it assigned to same cluster
# contingency table of pairs, (TP+TN)/(TP+TN+FP+FN)
# robust version of rand index, ARI


# install.packages("flexclust")
library("flexclust")
a = table(km.cl$cluster, class_label)
randIndex(a)


# Internal evaluation metric
# -------------------------

#Silhouette Value
# S(i) = {b(i) - a(i)}/max{a(i),b(i)}
# value between -1 and 1, higher is better
# silhouette() function in "cluster" package

library("cluster")

km.cl.med <- pam(iris[,1:4], k = 3, metric = "manhattan")
si <- silhouette(km.cl.med)

#dev.new()
plot(si, col = c("red", "green", "blue"),main = "Silhouette Plot")
table(iris$Species, km.cl.med$clustering)

# average silhouette width
km.cl.med$silinfo
km.cl.med$silinfo$avg.width


# Calculating silhouette width
si2 <- silhouette(km.cl.med$clustering, dist(iris[,1:4], "manhattan"))
plot(si2, col = c("red", "green", "blue"),main = "Silhouette Plot")
print(si2)

# calculate the mean of silhouette width for all observations
# average silhouette width
print(mean(si2[,3]))



# Silhouettefor K-means
km.cl <- kmeans(iris[,1:4], centers = 3, nstart = 10)
si3 <- silhouette(km.cl$cluster, dist(iris[,1:4], "euclidean"))
plot(si3, col = c("red", "green", "blue"),main = "Silhouette Plot K means")

# average silhouette widht
print(mean(si3[,3]))



# Silhouette for hierarchical
iris.h.clust <- agnes(x = iris[,1:4], # data
                      stand = TRUE, # standardize
                      metric = "euclidean", # distance metric
                      method = "complete" # linkage method
)

clusters <- cutree(iris.h.clust, k = 3)
si4 <- silhouette(clusters, daisy(iris[,1:4], metric = "euclidean"))
plot(si4, col = c("red", "green", "blue"),main = "Silhouette Plot Hierarchical cluster")
print(mean(si4[,3]))



# other useful statistics on clustering
library("fpc")
st <- cluster.stats(dist(iris[,1:4], "euclidean"), km.cl$cluster)
print(st)
