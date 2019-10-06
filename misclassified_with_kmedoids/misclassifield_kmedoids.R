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




# 2.Kmedoid
# -------------
library("cluster")
kmed.cl <- pam(data.cluster, k = 2, metric = "manhattan")
table(kmed.cl$clustering, breast.cancer.new$class)
