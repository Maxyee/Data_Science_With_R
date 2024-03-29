# 4. k-modes
# ----------------
install.packages("klaR")
library("klaR")

set.seed(137)
df <- rbind(matrix(rbinom(250, 1, 0.25), ncol = 5), matrix(rbinom(250, 1, 0.75), ncol = 5))
colnames(df) <- c("A", "B", "C", "D", "E")
head(df)


kmodes.cl <- kmodes(df, modes = 2, iter.max = 50)
plot(jitter(df), col = kmodes.cl$cluster, main = "kmodes")
points(kmodes.cl$modes, col = 1:2, pch = c("1","2") , cex=3, lwd=3)
