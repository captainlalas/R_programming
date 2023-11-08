library(tidyverse)

View(msleep)
# %>% is the and operator in R
#mydata <- msleep %>%     #Daraset
#    select(name, genus, vore) %>% #Columns
#    filter(vore == "cani")
    
mydata <- msleep %>%     
    select(name, order, bodywt, sleep_total) %>%
    filter(order == "Primates" | bodywt > 20) # the comma is the same as AND

mydata <- msleep %>%     
    select(name, order, bodywt, sleep_total) %>%
    filter(name %in% c("Cow", "Dog", "Horse", "Cheetah")) 

mydata <- msleep %>%     
    select(name, order, bodywt, sleep_total) %>%
    filter(between(sleep_total, 12, 18)) 

mydata <- msleep %>%     
    select(name, order, bodywt, sleep_total) %>%
    filter(near(sleep_total, 17, tol=1))
# plot(mydata)
mydata <- msleep %>%     
    select(name, conservation, sleep_total, bodywt) %>%
    filter(is.na(conservation))