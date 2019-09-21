
# here is the read.table() fuction, it is a default fuction which read file form the pc.
# another thing is na.strings = "?" which replace the question mark missing value with 'NA'

heart_disease_db <- read.table(file="processed.cleveland.data", header = FALSE, sep = ",", na.strings = "?",strip.white = TRUE, stringsAsFactors = FALSE)

head(heart_disease_db)  # this head() function retive the first 6 values from the data file


colnames(heart_disease_db) <- c("age", "sex", "cp", "trestbps", "chol",
                                "fbs", "restecg", "thalach", "exang",
                                "oldpeak", "slope", "ca", "thal", "class") # this colnames() function assigns the name of the colum name of the dataset value


head(heart_disease_db)  # after adding the columnames we again retrive the the first 6 values again




#plot boxplot
#----------------------------------
boxplot(heart_disease_db$age, pch=20, col="red", main = "Age distribution")

# two box plots for patients age, one for healthy and other with heart problem
boxplot(age ~ class, data = heart_disease_db, col = "red", main = "Age distribution", names = c("Healthy", "Diseased"))
boxplot(age ~ cp, data = heart_disease_db, col = "red", main = "Age distribution")
