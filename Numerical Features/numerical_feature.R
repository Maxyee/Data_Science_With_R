
# here is the read.table() fuction, it is a default fuction which read file form the pc.
# another thing is na.strings = "?" which replace the question mark missing value with 'NA'

heart_disease_db <- read.table(file="processed.cleveland.data", header = FALSE, sep = ",", na.strings = "?",strip.white = TRUE, stringsAsFactors = FALSE)

head(heart_disease_db)  # this head() function retive the first 6 values from the data file


colnames(heart_disease_db) <- c("age", "sex", "cp", "trestbps", "chol",
                                "fbs", "restecg", "thalach", "exang",
                                "oldpeak", "slope", "ca", "thal", "class") # this colnames() function assigns the name of the colum name of the dataset value


head(heart_disease_db)  # after adding the columnames we again retrive the the first 6 values again



#for numerical features in the dataset

# minimum value
min(heart_disease_db$age)
# maximum value
max(heart_disease_db$age)
# mean value
mean(heart_disease_db$age)
# median value
median(heart_disease_db$age)
# standard deviation
sd(heart_disease_db$age)
# variance
var(heart_disease_db$age)
# range (minimum maximum)
range(heart_disease_db$age)
# quantiles
quantile(heart_disease_db$age)

# summarize the numeric feature value
summary(heart_disease_db$age)
