library('tidyverse')
library('here')

comic_data <- read.csv('week9_comic_characters.csv',header = TRUE)

#explore dataset ------------------------------
glimpse(comic_data)
head(comic_data)

comic_data %>%
  count(sex) %>%
  View()



#convert NA into Unknown
#create a column that collapses non-binary genders into lgbtq column

comic_data %>%
  count(align) %>%
  View()


comic_data %>%
  count(alive) %>%
  View()

#objectives

#which hero has the most appearances?
#which villian has the most appearances?
#Which hero has the least amount of apperances
#which villian has the least amount of appearances?
#how many lgbtq character are their?
#are non-binary charcters usually aligned with good or bad
#timeline of female charatcers throughout comic history
#how many dead characters are in this data set? Are most of the dead characters women?

#wrangle the data ----------------------------
#' change publisher, eye, hair,sex, align into factor variables
#' fill NAs with unknown

data <- comic_data %>%
  mutate(sex = replace_na(sex,'Unknown')) %>%
  mutate(across(c(publisher,id,align,eye,hair,sex,alive),factor)) 
  
  
  data %>%
    count(sex) %>%
    View()
  
#create a line graph of sex and date
data %>%
  group_by(year) %>%
  count(sex) %>%
  View()
 

data %>%
  group_by(year) %>%
  count(sex) %>%
  #filter(sex %in% c('Male Characters','Female Characters'))%>%
  ggplot(aes(x=year,y=n,color=sex)) +
  geom_line()
  

data %>%
  group_by(sex) %>%
  #filter(sex %in% c('Male Characters','Female Characters'))%>%
  count(alive) %>%
  View()

#who has the most appearances?

  
  
  
