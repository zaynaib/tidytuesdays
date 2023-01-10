# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

library(tidytuesdayR)
library(tidyverse)

tuesdata <- tidytuesdayR::tt_load('2021-07-13')

scoobydoo <- tuesdata$scoobydoo

# Or read in the data manually

scoobydoo[which.max(scoobydoo$imdb),]

scoobydoo <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv')

sub_doo <- scoobydoo %>% select(series_name, network,season,imdb,format,monster_gender,monster_gender,monster_type,monster_species)

monster_count <- sub_doo %>% count(monster_type)

sub_doo %>% count(monster_type,monster_species) %>% filter(monster_species == "Human") %>% arrange(desc(n))

sub_doo %>% count(monster_type,monster_species) %>% arrange(desc(n))