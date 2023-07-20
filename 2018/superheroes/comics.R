library('tidyverse')

comic_data <- read.csv('week9_comic_characters.csv',header = TRUE)

#explore dataset ------------------------------
glimpse(comic_data)
head(comic_data)

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