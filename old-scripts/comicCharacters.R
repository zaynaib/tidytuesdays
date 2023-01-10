#set as working directory
setwd("C:/Users/mutiu/Desktop/project/rPractice/tidytuesdays")


#allows you to download R package from independent programmers
install.packages("devtools")
devtools::install_github("thebioengineer/tidytuesdayR")

# download tidyverse library
library("tidyverse")

#read the data
comic_characters <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-05-29/week9_comic_characters.csv')

#preview the data all the variables and types of R
glimpse(comic_characters)

#get a subset of our varibles

subset <- comic_characters %>% select(publisher, name, eye, hair, appearances,sex,alive)

subset %>%arrange(appearances)

subset %>%arrange(desc(appearances))
#totally surprise that fantsitic 4 the Thing is in this set
comic_characters %>% filter(publisher =="Marvel")


#USING MULTIPLE VERBS AT A TIME 
subset <- comic_characters %>% select(publisher, name, eye, hair, appearances,sex,alive) %>% filter(publisher == "Marvel") %>% arrange(appearances)

comic_characters %>% select(publisher, name, eye, hair, appearances,sex,alive) %>% filter(publisher == "Marvel",sex=="Female") %>% arrange(appearances)

#in order to find distinct values use unique for class variables and distinct for non class variables
unique(comic_characters$sex)


subset %>% count(sex,sort = TRUE)

#Who is the most comic book apperances in Marvel comics?

#filter all the Marvel characters

#find the max number of comic book characthers


#Who has the list comic book apperances in Marverl Comics?


spotify_songs <- tuesdata$spotify_songs

#how to find the percentage  total/100
# percentatge *100 = total


