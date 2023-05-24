library("readxl")
library("tidyverse")

#review this resources ###
#http://statseducation.com/Introduction-to-R/modules/tidy%20data/gather/
#http://statseducation.com/Introduction-to-R/modules/tidy%20data/tidy-data/

#setwd("C:/Users/krros/Desktop/tidytuesdays")
#setwd("C:/Users/krros/Desktop/tidytuesdays/2018/tuition_data")

tuition_data <- read_excel('us_avg_tuition.xlsx')
glimpse(tuition_data)


#tuition_data %>%
#  pivot_longer("Alabama")

clean_tuition <- tuition_data %>%
  gather("s",'population',2:13)
#Year is a string instead of a number

#I need to mutate the columns
