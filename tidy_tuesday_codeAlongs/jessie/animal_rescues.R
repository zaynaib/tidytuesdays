# objective(s) ------------------------------------------------------------------
#' create a sorted bar chart of animal rescues in London
#' 


# set up environment -------------------------------------------------------
library(tidyverse)
library(here)

# import data ---------------------------------------------------
animal_rescues <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-06-29/animal_rescues.csv')

#inspect data -----------------------------------------------------
glimpse(animal_rescues)

animal_rescues %>%
  count(animal_group_parent) %>%
  View()


data <- animal_rescues %>%
  mutate(animal_group_parent = recode(animal_group_parent,
                                      cat = "Cat",
                                      Budgie = "Bird",
                                      Pigeon = "Bird"),
         animal_group_parent = case_when(str_detect(animal_group_parent, "Unknown")~"Unknown",
                                         TRUE ~ animal_group_parent)) %>%
  mutate(across(where(is.character),factor))
  
glimpse(data)

data %>%
  count(animal_group_parent) %>%
  View()

# create our sorted bar chart ---------------------------------------------------------
data %>%
  count(animal_group_parent) %>%
  ggplot(aes(x = reorder(animal_group_parent, n),y =n,fill=animal_group_parent)) +
  geom_col(show.legend = FALSE) +
  coord_flip()

#Next steps
#' color theme
#' look at change over type
#' graph/map
#' 

ggsave(here('tidy_tuesday_codeAlongs/jessie/sortedBar.png'))
