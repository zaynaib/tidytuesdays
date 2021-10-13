#Resources: https://stackoverflow.com/questions/37147315/remove-a-suffix-to-a-value-of-a-data-frame

#'Setup Environment
#'glimpse at data
#'Ask questions
#'explore and visualize


library('tidyverse')
library('readxl')
library('here')

here()
setwd(here())
tuition <- read_excel('us_avg_tuition.xlsx')

glimpse(tuition)

tidy_tuition <- tuition %>%
  pivot_longer(-State,names_to="year",values_to="cost") %>% 
  mutate(year = gsub("\\-\\d+$","",year))

tidy_tuition$year <-as.integer(tidy_tuition$year)

#Questions
#Which state had the cheapest tuition in 2015?
#Which state had the most expensive tuition in 2015?
# What is illinois tuition from 2009 -2015
#Which state on average is the cheapest?
#What is the median of tuition in 2015?
#Can I make a linear regression model to accurately predict

latest_cost <- tidy_tuition %>%
  filter(year == 2015)

latest_cost[which.min(latest_cost$cost),]

latest_cost[which.max(latest_cost$cost),]

illinois_cost <- tidy_tuition %>%
  filter(State == "Illinois")

ggplot(illinois_cost,aes(x=year,y=cost)) +geom_line()

#average tuition of all state and all years of the data set
avg_tuition <- mean(tidy_tuition$cost)

tidy_tuition %>%
  group_by(year)%>%
  filter(cost < avg_tuition)

#which states have tuition that is less that avg. cost in 2015
tidy_tuition %>%
  filter(cost < avg_tuition & year == 2015)

#average tuition for each state over the years
tidy_tuition %>%
  group_by(State)%>%
  summarize(Mean=mean(cost,na.rm=TRUE))

#create a linear regression to predict cost of tuition for the state of illinois

future_cost <- lm(illinois_cost$cost~illinois_cost$year)

summary(future_cost)

