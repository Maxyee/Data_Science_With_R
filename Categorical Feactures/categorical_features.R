
# here is the read.table() fuction, it is a default fuction which read file form the pc.
# another thing is na.strings = "?" which replace the question mark missing value with 'NA'

heart_disease_db <- read.table(file="processed.cleveland.data", header = FALSE, sep = ",", na.strings = "?",strip.white = TRUE, stringsAsFactors = FALSE)

head(heart_disease_db)  # this head() function retive the first 6 values from the data file


colnames(heart_disease_db) <- c("age", "sex", "cp", "trestbps", "chol",
                                "fbs", "restecg", "thalach", "exang",
                                "oldpeak", "slope", "ca", "thal", "class") # this colnames() function assigns the name of the colum name of the dataset value


head(heart_disease_db)  # after adding the columnames we again retrive the the first 6 values again



# For categorical features
table("sex" = heart_disease_db$sex, "Disease" = heart_disease_db$class) # how many male and female for specific disease

# to show
db2 <- heart_disease_db
db2$sex[which(db2$sex == 0)] <- "female"
db2$sex[which(db2$sex == 1)] <- "male"

db2$class[which(db2$class == 0)] <- "no"
db2$class[which(db2$class == 1)] <- "yes"

table("sex" = db2$sex, "Disease" = db2$class)
table(db2$sex, db2$class, dnn = c("sex", "Disease"))
