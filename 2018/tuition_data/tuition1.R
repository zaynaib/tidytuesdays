library("readxl")
library("tidyverse")

#https://orchid00.github.io/us_avg_tuition.html
#danaseidel.com/2018-04-02-Week1/
#https://cran.r-project.org/web/packages/geofacet/vignettes/geofacet.html
#https://ryanhafen.com/blog/geofacet/


setwd("C:/Users/krros/Desktop/tidytuesdays/2018/tuition_data")

tuition_data <- read_excel('us_avg_tuition.xlsx')
glimpse(tuition_data)

clean_tuition <- tuition_data %>%
  gather("year",'cost',-1)%>% 
  mutate(year = gsub("\\-\\d+$","",year)) %>%
  mutate(year = as.numeric(year))

clean_tuition %>%
  glimpse()

clean_tuition %>% filter(State == 'Alabama') %>%
  ggplot(aes(x=year,y=cost)) +
  geom_line(color = 'steelblue',size=2) +
  theme(
  panel.background = element_blank()
  )
#ggplot(illinois_cost,aes(x=year,y=cost)) +geom_line()

clean_tuition %>%
  ggplot(aes(x=year,y=cost)) +
  geom_line()+
  facet_wrap(~State)



clean_tuition %>% filter(State %in% c('Alabama', 'Illinois','California','Massachusetts')) %>%
  ggplot(aes(x=year,y=cost,color = State)) +
  geom_line(size=2) +
  scale_y_continuous(breaks = seq(5000,13000,1000),name = 'Tuition Costs') +
  theme(
    panel.background = element_blank(),
    panel.grid = element_line(color = "#EC4899")
  )


clean_tuition %>% filter(State %in% c('Alabama', 'Illinois','California','Massachusetts')) %>%
  ggplot(aes(x=year,y=cost,color = State)) +
  geom_line(size=2) +
  scale_y_continuous(breaks = seq(5000,13000,1000),name = 'Tuition Costs') +
  theme(
    panel.background = element_blank(),
    panel.grid = element_line(color = "#EC4899")
  )+
  facet_wrap(~State)