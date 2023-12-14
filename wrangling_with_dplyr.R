# Working with dplyr, we will only load the tidyverse package bcz dplyr is included
# library(dplyr) 

# dyplr is one of the most used R libraries for data wrangling
# it features 4 core functions: select, filter, arrange and mutate
library(tidyverse)

# We will use the Texas houses data txhousing
# data()
# View(txhousing)

txhousing_2000 <- filter(txhousing, year >= 2000, year<2010)
View(txhousing_2000)
# 1- working with Filter
?filter
diamonds_cut <- filter(diamonds, cut == "Premium")
View(diamonds_cut)
str(diamonds_cut)
names(diamonds)
glimpse(diamonds)

# 2 select function (on rows)
?select
diam_al <- select(diamonds, starts_with('c'))
diam_al <- select(diamonds, contains('c'))
View(diam_al)

# working with the pipe operator
diam_table_arrange <- diamonds %>% 
    select(-(x : z)) %>% 
    filter(carat>1) %>% 
    mutate(mass_gram = 0.20 * carat) %>% 
    arrange(desc(price), carat) %>% 
    View()

# working with the pipe operator
diam_table_arrange <- diamonds %>% 
    select(-(x : z)) %>% 
    filter(price>1000) %>% 
    mutate(mass_gram = 0.20 * carat, price_pg = price/mass_gram, expensive = price > 10000) %>% 
    arrange(desc(price), carat) %>% 
    View()

# Other verb to check with slice, rename, left_join, case_when
?slice

# Group by and summarize
diamonds %>% 
    group_by(cut, color) %>% 
    summarise(avg_price = mean(price), sd_price =sd(price), count = n())

diamonds %>% 
    group_by(luxurious = price > 10000) %>% 
    summarise(avg_price = mean(price), sd_price =sd(price), count = n())
