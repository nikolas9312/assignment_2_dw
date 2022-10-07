# Assignment 2 - Data Wrangling
# Kajari Saha - Nicolas Herrera

##Question 1:Setting up the data##
install.packages("tidyverse")
library(tidyverse)
airbnb <- read_csv("assign_2.csv", col_names = TRUE)

View(airbnb)

airbnb <- rename(airbnb, neighborhood = neighbourhood)

##Question 2: Piping Practice##

##2(a)##
neighborhoods <- airbnb %>% group_by(neighborhood) %>% summarise(n=n())

##2(b)##
neighborhoods <- neighborhoods %>% filter(!is.na(neighborhood)) 
neighborhoods <- neighborhoods %>%  arrange(desc(n)) %>% head(20)

##2(c)##
airbnb_top_neighborhoods <- airbnb %>% filter(airbnb$neighborhood %in% neighborhoods$neighborhood)

##2(d)##
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% group_by(neighborhood) %>% summarise(avg_square_feet=mean(square_feet, na.rm=TRUE), avg_price=mean(price, na.rm=TRUE), sd_price=sd(price, na.rm=TRUE), max_price=max(price, na.rm=TRUE), min_price=min(price, na.rm=TRUE)) %>% arrange(desc(avg_square_feet))

##2(e)-Private Question##
highest_avg_square_ft <- summary_stats_top_neighborhoods$avg_square_feet[1]

##2(f)-Private Question##
second_avg_price <- summary_stats_top_neighborhoods$avg_price[2]
