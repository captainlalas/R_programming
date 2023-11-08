library(gapminder)
View(gapminder)

data <- select(gapminder, country, year, lifeExp)

data <- gapminder %>%
    select(country, year, lifeExp) %>%
    View()

wide_data <- data %>% 
    pivot_wider(names_from = year, values_from = lifeExp)

long_data <- wide_data %>% 
    pivot_longer(2:13, names_to = "year", values_to = "lifeExp")