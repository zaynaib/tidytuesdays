#https://www.eatgamelove.com/2021-07-15-tidy-tuesday-scooby-doo/
#https://www.youtube.com/watch?v=YHdQSdOa6EY

#'Functions used to tidy data
#'separate_rows
#'str_trim
#rnotebooks/ rmarkdown files share code

#setup
library(tidyverse)

#import our data
#cannot edit NULL values. Treats it as an empty string
scoobydoo <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv', na = "NULL")

glimpse(scoobydoo)

#exploratory data analysis
scoobydoo %>%
  count(monster_type)

scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  count(monster_type)


scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  count(monster_type) %>%
  View()

#-inventory of issues
#' - blank [DONE]
#' - Disuised with a space [DONE]
#' - mispellings of Disguised [DONE]
#' - Possessed and Possessed Object [DONE]
#' - NA values [DONE]

#drop_nas
scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  drop_na(monster_type) %>%
  count(monster_type) %>%
  View()


#drop blank monster type
scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  drop_na(monster_type) %>%
  filter(monster_type != "")%>%
  count(monster_type) %>%
  View()


#trimmed blank spaces before and after
scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  drop_na(monster_type) %>%
  filter(monster_type != "")%>%
  mutate(monster_type = str_trim(monster_type))%>%
  count(monster_type) %>%
  View()


scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  drop_na(monster_type) %>%
  filter(monster_type != "")%>%
  mutate(monster_type = str_trim(monster_type))%>%
  mutate(monster_type = recode(monster_type,
                               Disguise = "Disguised",
                               Disugised = "Disguised")) %>%
  count(monster_type) %>%
  View()


scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  drop_na(monster_type) %>%
  filter(monster_type != "")%>%
  mutate(monster_type = str_trim(monster_type))%>%
  mutate(monster_type = recode(monster_type,
                               Disguise = "Disguised",
                               Disugised = "Disguised",
                               Possessed = "Possessed Object")) %>%
  count(monster_type) %>%
  View()


tidy_scooby <- scoobydoo %>%
  separate_rows(monster_type, sep=",",convert =TRUE) %>%
  drop_na(monster_type) %>%
  filter(monster_type != "")%>%
  mutate(monster_type = str_trim(monster_type))%>%
  mutate(monster_type = recode(monster_type,
                               Disguise = "Disguised",
                               Disugised = "Disguised",
                               Possessed = "Possessed Object"),
         across(where(is.character),factor))

tidy_scooby %>%
  group_by(motive) %>%
  summarise(count = n()) %>%
  ggplot(aes(reorder(motive,count),count))+
  geom_col()+
  coord_flip()
  

#what is the average ratings of scoobydoo episodes?
class(scoobydoo$imdb)
mean(as.numeric(scoobydoo$imdb), na.rm = TRUE)

#how many seasons of scoobydoo are there?
scoobydoo %>% count(season)

#who has unmasked the most monsters?
scoobySubset <- tidy_scooby[,18:22]
View(scoobySubset)

clean_scooby <- bind_cols(tidy_scooby[,2],scoobySubset)

who_unmasked <- clean_scooby %>%
  pivot_longer(-series_name,names_to="whoUnmasked",values_to="isUnmasked") %>% 
  group_by(whoUnmasked) %>% count(isUnmasked) %>% filter(isUnmasked ==TRUE) %>%
  View()


who_unmasked <- clean_scooby %>%
  pivot_longer(-series_name,names_to="whoUnmasked",values_to="isUnmasked") %>% 
  group_by(whoUnmasked) %>% count(isUnmasked) %>% filter(isUnmasked ==TRUE) %>%
  View()


#who has been caught the most?

#which episodes have the most amount of monsters

#How many episodes scrappy do was in?

#What is the most frequent monster type

#What is the most frequent mosnter type based on gender?

#Which crew memeber unmasked the most villians?


#Examples
#https://www.eatgamelove.com/2021-07-15-tidy-tuesday-scooby-doo/
#https://hardin47.github.io/TidyTuesday/2021-07-13/scooby.html