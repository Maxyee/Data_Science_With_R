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


# 1. kmeans
# ---------------------------
within_ss <- numeric(10)
for(i in 1:10){
  km.cl <- kmeans(data.cluster, centers = i, nstart = 10)
  within_ss[i] <- km.cl$tot.withinss
}

# plot number of centers Vs. total within SS
plot(x = 1:10, y = within_ss, type='b', xlab = "K", ylab = "total within SS")

# Kmeans with K = 2

# use pca
pr.out <- prcomp(data.cluster, scale = FALSE, center = FALSE)
pc <- pr.out$x
plot(pc[,1:2], col = km.cl$cluster, pch = (1 + breast.cancer.new$class),  main="Breast Cancer clusters")
