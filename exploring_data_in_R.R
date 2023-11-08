library(tidyverse)
View(starwars)

dim(starwars)
str(starwars)  #Structure
glimpse(starwars)  #Neater version of str
unique(starwars$gender) #Unique Values of a varaiblee


tail(starwars)
attach(starwars)
names(starwars)  #Variables names, columns
unique(starwars$hair_color)

#1. Dealing with char or factor variables
View(sort(table(starwars$hair_color), decreasing = TRUE))
barplot(sort(table(starwars$hair_color), decreasing = TRUE))

#We can do the view function in better way
starwars %>%
    select(hair_color) %>%
    count(hair_color) %>%
    arrange(desc(n)) %>%
    View()
#Data with missing value in hair_style
View(starwars[is.na(starwars$hair_color), ])


#2. Dealing with num varaibles
class(starwars$height)
length(starwars$height)
summary(starwars$height)
boxplot(starwars$height)
hist(starwars$height)

#Another Lesson begins here

# Converting Gender as factor and applying level
starwars$gender <- factor((starwars$gender), levels = c("masculine", "feminine"))
levels(starwars$gender)


#Selecting variables
# Cleaning Data
names(starwars)

starwars %>% #Shortcut for the operator is Ctrl+Shift+M
    select(name, height, ends_with("color"))

unique(starwars$hair_color)

starwars %>% #Shortcut for the operator is Ctrl+Shift+M
    select(name, height, ends_with("color")) %>% 
    filter(hair_color %in% c("blond", "brown") &
               height < 180)
#Dealing with missing data, you need to understand your data and understand what to exclude
mean(starwars$height, na.rm = TRUE)

starwars %>% #Shortcut for the operator is Ctrl+Shift+M
    select(name, gender, hair_color, height) %>% 
    # na.omit()  #Not recommended
    filter(!complete.cases(.)) #To remove observations with any missing values and we add ! to do the opposite

#Now we want to delete observations where height is missing
starwars %>% 
    select(name, gender, hair_color, height) %>% 
    filter(!complete.cases(.)) %>% 
    drop_na(height)

#And view the rest of the data
starwars %>% 
    select(name, gender, hair_color, height) %>% 
    drop_na(height) %>% 
    View()

#Dealing with hair_color missing values
starwars %>% 
    select(name, gender, hair_color, height) %>% 
    filter(!complete.cases(.)) %>% 
    mutate(hair_color = replace_na(hair_color, "none"))  #To create a new var or change an existing one


#Recoding gender variable
starwars %>% 
    select(name, gender) %>% 
    mutate(gender = recode(gender,
                           "masculine" =1, "feminine" =2))
