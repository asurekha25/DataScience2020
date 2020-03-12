#sys.Date() returns todays date

date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

managers <- data.frame(date_col, 
                       country_col, 
                       gender_col, 
                       age_col, 
                       q1_col, 
                       q2_col, 
                       q3_col,
                       q4_col,
                       q5_col)

colnames(managers) <- column_names

str(managers)

#create a new column called agecat(so that age cat becomes ordinal factored column) and categorise
managers$Age[managers$Age == 99] <- NA
managers
managers$AgeCat[managers$Age >=45] <- "Elder"
managers$AgeCat[managers$Age >=26  & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[is.na(managers$Age)] <- "Elder"

#show contents of managers dataframe
managers
AgeCat <- factor(managers$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))
managers$AgeCat <- AgeCat

#summary of each row in the dataframe
summary_col <- managers$Q1 + managers$Q2 + managers$Q3 + managers$Q4 + managers$Q5
summary_col   
managers <- data.frame(managers, summary_col)
managers

#subset() to select variable and observations
new_data <- subset(managers, age_col >= 35 | age_col < 24, select = c(Q1, Q2, Q3, Q4))
new_data

#calculate the mean value of each row
mean_value <- rowMeans(managers[5:9])
mean_value
managers <- data.frame(managers, mean_value)
managers

names(managers)[12] <- "mean value"
names(managers)[11] <- "Answer total"
str(managers)


#change the date structure from factor
#we cant convert a factor to date
#without converting to a character vector first

date_field <- as.character(managers$Date)
date_field


new_date <- as.Date(date_field, "%y-%d-%m")
new_date

managers$Date <- new_data
managers

#dealing with missing data

new_data <- na.omit(managers)
new_data

complete_data <- complete.cases(managers)
complete_data
sum(complete_data)

install.packages("mice")
library(mice)
md.pattern(managers)
install.packages("VIM")
library(VIM)


