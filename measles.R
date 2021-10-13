setwd('C:/Users/mutiu/Desktop/project/rPractice/tidytuesdays')
library(tidyverse)

measles <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-25/measles.csv')
view(measles)

measles_il <- measles %>% filter(state == 'Illinois' )

il_infected <- measles_il %>% filter(mmr < 94)
nrow(il_infected)

il_infected2 <- measles_il %>% filter(mmr<83)
nrow(il_infected2)

il_infected2 %>% filter(!is.na(xmed))

il_infected2 %>% filter(!is.na(xrel))



#what is heard immunity?
#https://www.slideshare.net/singh_br1762/r0-value-herd-immunity
#https://www.ovg.ox.ac.uk/news/herd-immunity-how-does-it-work
#https://www.pbs.org/wgbh/nova/article/herd-immunity/
#https://www.theguardian.com/society/ng-interactive/2015/feb/05/-sp-watch-how-measles-outbreak-spreads-when-kids-get-vaccinated

#what precentage need for herd immunity to be effect
#What is R0 ? - reproductive rate


#what school has the lowest mmr

#average rate for type, city 