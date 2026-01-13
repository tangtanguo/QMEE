# 09 - Jan - 2025 Assignment 1
#Tang Tang Guo

#Library ----------
library(ggplot2)
library(tidyverse)
#------------------

# I am currently in the process of collecting my own data. 
# Therefore, I will be using the built-in dataset "ChickWeight" for this first assignment. 

data <- read.csv("ChickWeight.csv")
# I've saved it as a csv file, but it can also just be read in without a CSV copy, since
# the file is built in. 

head(data)
summary(data)
# this df gives me the weights of chicks by day and diet, but I want to plot the average weights over time, grouped by diet type
## BMB: try not  to call your data 'data' (see fortunes::fortune('dog'))

# My Substantive Calculation:A

avg_weights <- data %>%
  group_by(Time, Diet) %>%
  summarise(meanmass = mean(`weight`, na.rm = TRUE), .groups = "drop") 

# My Attempt at 3:Excellent, are you impressed yet
## BMB definitely :-)
## don't need back-ticks unless the variable name is 'illegal' (has spaces etc.)
## why call the mean of  weight 'mass'? (admittedly doesn't matter much)

## BMB: alternatively:
data |> summarise(across(weight, ~ mean(., na.rm = TRUE)), .by = c(Time, Diet)) |>
  mutate(across(Diet, as.factor))

## BMB: I'd make Diet a factor for better colours
ggplot(avg_weights, aes(x = Time, y = meanmass, colour = Diet, group = Diet)) +
  geom_line() +
  labs(
    title = "Chick Weight vs Time by Diet Type",
    x = "Time (days)",
    y = "Weight (grams)",
    color = "Diet Type"
  ) +
  theme_classic()

## mark: 2

