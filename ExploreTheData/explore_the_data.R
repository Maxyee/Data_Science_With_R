
# here is the read.table() fuction, it is a default fuction which read file form the pc.
# another thing is na.strings = "?" which replace the question mark missing value with 'NA'

heart_disease_db <- read.table(file="processed.cleveland.data", header = FALSE, sep = ",", na.strings = "?",strip.white = TRUE, stringsAsFactors = FALSE)

head(heart_disease_db)  # this head() function retive the first 6 values from the data file


colnames(heart_disease_db) <- c("age", "sex", "cp", "trestbps", "chol",
                                "fbs", "restecg", "thalach", "exang",
                                "oldpeak", "slope", "ca", "thal", "class") # this colnames() function assigns the name of the colum name of the dataset value


head(heart_disease_db)  # after adding the columnames we again retrive the the first 6 values again



# Explore the data
#-----------------------------------
dim(heart_disease_db)  # dim function says how many obs and how many variable are there.
nrow(heart_disease_db) # nrow function says how many rows are there.
ncol(heart_disease_db) # ncol function says how many coloum are there

str(heart_disease_db)  # see structure of the dataframe

table(heart_disease_db$class) # Into the dataset there is a column called class and 
                              #into this class there are many values,
                              #how many times that values come this code assign that


heart_disease_db$class[which(heart_disease_db$class != 0)] <- 1  # replacing other values to 1

# see the changed class distribution
table(heart_disease_db$class)

