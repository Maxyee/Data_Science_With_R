breast.cancer <- read.table(file="http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data",
                            header = FALSE, sep=",", 
                            colClasses = NA, stringsAsFactor = FALSE, na.strings = "?")


breast.cancer.new <- breast.cancer[,2:11] 


names(breast.cancer.new) <- c("clump_thickness",
                              "uniform_cellsize",
                              "uniform_cellshape",
                              "marginal_adhesion",
                              "epithelial_cellsize",
                              "bare_nuclei",
                              "bland_chromatin",
                              "normal_nucleoli",
                              "mitoses",
                              "class")

breast.cancer.new <- na.omit(breast.cancer.new)


# class, 2 = benign, 4 = malignant

data.cluster <- breast.cancer.new[,-10]


#Hierarchical Clustering and Dendrogram plot
# ----------------------------------------------

data.cluster <- scale(data.cluster)

# calculate distance matrix (distance between each observations) using dist() function
distance_matrix <- dist(data.cluster, method = "euclidean")
cancer.h.clust <- hclust(d = distance_matrix, method = "complete")
plot(cancer.h.clust, main = "Hierarchial Cluster")



#Cut the dendrogram tree to get TWO clusters
clusters <- cutree(cancer.h.clust, k = 2)
table(clusters, breast.cancer.new$class)
