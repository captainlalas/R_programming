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
