#Importing and Excel file limited to 50 rows
library(readxl)
Employee_Data_clean <- read_excel("Employee_Data-clean.xlsx", n_max = 50)
View(Employee_Data_clean)

#Import the CSV limited to 50 as well
Employee_Data <- read.csv("~/R_folder/Employee_data/Employee_Data.csv", nrows=50)
View(Employee_Data)

?read.csv
?barplot
?pie


# Binomial distribution
# We had a questionnaire of 25 questions with one correct answer out of 5 for each question
# we want to know the prob of having 20 correct answers
dbinom(20, 25, prob = 0.2) #P(X=20)

# Let's look into normal distribution
qnorm(p=0.25, mean=75, sd=5, lower.tail = TRUE)

x <- seq(from=55, to=95, by=.25)
dens <- dnorm(x, mean=75, sd=5)
plot(x, dens, type="l", main = "X~Nomal with mean=75 and SD=5", xlab = "x", ylab = "Probability density", las=1)
abline(v=75)
