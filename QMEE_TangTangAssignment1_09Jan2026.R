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

# My Substantive Calculation:A

avg_weights <- data %>%
  group_by(Time, Diet) %>%
  summarise(meanmass = mean(`weight`, na.rm = TRUE), .groups = "drop") 
wha
# My Attempt at 3:Excellent, are you impressed yet

ggplot(avg_weights, aes(x = Time, y = meanmass, colour = Diet, group = Diet)) +
  geom_line() +
  labs(
    title = "Chick Weight vs Time by Diet Type",
    x = "Time (days)",
    y = "Weight (grams)",
    color = "Diet Type"
  ) +
  theme_classic()
