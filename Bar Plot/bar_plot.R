
# here is the read.table() fuction, it is a default fuction which read file form the pc.
# another thing is na.strings = "?" which replace the question mark missing value with 'NA'

heart_disease_db <- read.table(file="processed.cleveland.data", header = FALSE, sep = ",", na.strings = "?",strip.white = TRUE, stringsAsFactors = FALSE)

head(heart_disease_db)  # this head() function retive the first 6 values from the data file


colnames(heart_disease_db) <- c("age", "sex", "cp", "trestbps", "chol",
                                "fbs", "restecg", "thalach", "exang",
                                "oldpeak", "slope", "ca", "thal", "class") # this colnames() function assigns the name of the colum name of the dataset value


head(heart_disease_db)  # after adding the columnames we again retrive the the first 6 values again


#bar plot for categorical features

# e.g cp (chest pain type) 1 = typical angina, 2 = atypical angina, 3 = non-anginal pain, 4 = asymptomatic


# run this line to save default parameteres for plot for resetting later on 
# par_default <- par(no.readonly = T)

# assign margin outside the plot area c(bottom, left, top, right), las = 2 makes the labels perpendicular to axis
par(mar=c(6,5,3,2), las=2)
#height_of_bar <- c(3,2,1,4)
print(heart_disease_db$cp)

table(heart_disease_db$cp)

height_of_bar <- table(heart_disease_db$cp).

#par(par_default)

barplot(height_of_bar, col=c("red", "green", "blue", "#90f1f5"),
        main = "Chest Pain Type",
        names.arg = c("typical angina", "atypical angina", "non anginal", "asymptomatic"),
        cex.names = 0.8)

# assign margin outside the plot area c(bottom, left, top, right)
par(mar=c(3,6,2,2), las=1)
barplot(table(heart_disease_db$cp), col=c("red", "green", "blue", "brown"),
        main = "Chest Pain Type",  xlim = c(0,150),
        names.arg = c("typical angina", "atypical angina", "non anginal", "asymptomatic"),
        cex.names = 0.8, horiz = TRUE)

# plot with legend
par(mar=c(3,3,2,2), las=1)
barplot(table(heart_disease_db$cp), col=c("red", "green", "blue", "brown"), names.arg = NA,
        main = "Chest Pain Type",  xlim = c(0,150), horiz = TRUE)

legend(x=80, y=2, legend = c("typical angina", "atypical angina", "non anginal", "asymptomatic"),
       col=c("red", "green", "blue", "brown"), pch = 15, cex = 0.75)


