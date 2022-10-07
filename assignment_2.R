# ------------------------------------------------------------
# Assignment 2 - Data Wrangling
# Kajari Saha - Nicolas Herrera
# ------------------------------------------------------------

# Libraries
library(tidyverse)
library(dplyr)


# Question 1
# ------------------------------------------------------------
airbnb <- read.csv("assign_2.csv")
airbnb <- tibble(airbnb)

# Question 2
# ------------------------------------------------------------
View(airbnb)
colnames(airbnb)

# Question 3
# ------------------------------------------------------------
airbnb <- rename(airbnb , neighborhood = neighbourhood)

# Question 4
# ------------------------------------------------------------
neighborhoods <- airbnb %>%
  group_by(neighborhood) %>%
  count(neighborhood)

# Question 5
# ------------------------------------------------------------
neighborhoods <- neighborhoods %>%
  filter(!is.na(neighborhood)) %>% 
  arrange(desc(n)) %>% 
  head(n=20)

# Question 6
# ------------------------------------------------------------
airbnb_top_neighborhoods <- airbnb %>% 
  filter(airbnb$neighborhood %in% neighborhoods$neighborhood)

# Question 7
# ------------------------------------------------------------
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% 
  group_by(neighborhood) %>%
  summarize( avg_square_feet = mean(square_feet , na.rm=T) , 
             avg_price = mean(price , na.rm=T ) ,
             sd_price =  sd(price , na.rm=T ) , 
             max_price =  max(price , na.rm=T ) , 
             min_price = min(price , na.rm=T) ) %>%
  arrange(desc(avg_square_feet))

# Question 8
# ------------------------------------------------------------
highest_avg_square_ft <- summary_stats_top_neighborhoods$avg_square_feet[1]

# Question 9
# ------------------------------------------------------------
second_avg_price <- summary_stats_top_neighborhoods$avg_square_feet[2]
