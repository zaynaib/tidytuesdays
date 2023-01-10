spotify_songs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv')

library(tidyverse)

lizzo <- spotify_songs %>% filter(track_artist == "Lizzo")
spotify_songs %>% filter(playlist_genre == "afrobeat")

wizkid <- spotify_songs %>% filter(track_artist == "WizKid")


artist <- spotify_songs %>% distinct(track_artist)

artist %>% filter(track_artist == "WizKid")

spotify_songs %>%   filter(playlist_subgenre == "urban contemporary")


pop_genre <- spotify_songs %>% 
  group_by(playlist_subgenre) %>%
  summarise(mean(track_popularity	))

ggplot(spotify_songs, aes(playlist_genre, track_popularity)) + 
  geom_boxplot()
  
