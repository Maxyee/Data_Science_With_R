
# here is the read.table() fuction, it is a default fuction which read file form the pc.
# another thing is na.strings = "?" which replace the question mark missing value with 'NA'

heart_disease_db <- read.table(file="processed.cleveland.data", header = FALSE, sep = ",", na.strings = "?",strip.white = TRUE, stringsAsFactors = FALSE)

head(heart_disease_db)  # this head() function retive the first 6 values from the data file


colnames(heart_disease_db) <- c("age", "sex", "cp", "trestbps", "chol",
                                "fbs", "restecg", "thalach", "exang",
                                "oldpeak", "slope", "ca", "thal", "class") # this colnames() function assigns the name of the colum name of the dataset value


head(heart_disease_db)  # after adding the columnames we again retrive the the first 6 values again




#Principal Component Analysis (PCA)

pr.out <- prcomp(heart_disease_db[,c("age","trestbps","chol","thalach")], scale = TRUE, center = TRUE)
names(pr.out)
head(pr.out$x)


principal_components <- pr.out$x
plot(principal_components[,1:2], col = (1 + heart_disease_db$class), pch = 20, main = "First two PC")


# proportion of variance explained by principal components
pr.var <- (pr.out$sdev)^2
pve <- pr.var/sum(pr.var)

# plot variance explained
# two plots side by side (1 row 2 columns)
# divide plot region into two

par(mfrow = c(1,2), oma = c(1,1,2,1))
plot(pve, xlab = "PC", ylab = "Variance explained", type = "b", ylim = c(0,1))
plot(cumsum(pve), xlab = "PC", ylab = "Cumulative variance", type = "b", ylim = c(0,1))
mtext("Proportion of Variance explained by PC", outer = TRUE)
par(mfrow = c(1,1))
