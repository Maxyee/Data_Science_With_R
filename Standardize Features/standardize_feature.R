
# here is the read.table() fuction, it is a default fuction which read file form the pc.
# another thing is na.strings = "?" which replace the question mark missing value with 'NA'

heart_disease_db <- read.table(file="processed.cleveland.data", header = FALSE, sep = ",", na.strings = "?",strip.white = TRUE, stringsAsFactors = FALSE)

head(heart_disease_db)  # this head() function retive the first 6 values from the data file


colnames(heart_disease_db) <- c("age", "sex", "cp", "trestbps", "chol",
                                "fbs", "restecg", "thalach", "exang",
                                "oldpeak", "slope", "ca", "thal", "class") # this colnames() function assigns the name of the colum name of the dataset value


head(heart_disease_db)  # after adding the columnames we again retrive the the first 6 values again



#Standardize numeric features

age_mean <- mean(heart_disease_db$age)
age_sd <- sd(heart_disease_db$age)


age_standardized <- (heart_disease_db$age - age_mean)/age_sd

# check Mean and sd of standardized age
mean(age_standardized) #near zero
sd(age_standardized) # always 1


# or simply use scale() function
age_standardized_2 <- scale(heart_disease_db$age)
mean(age_standardized_2)
sd(age_standardized_2)

