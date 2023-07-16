library(tidyverse)

ukraine_raw <- read_csv('data/results.csv')
colnames(ukraine_raw)
head(ukraine_raw)

#double check data type
glimpse(ukraine_raw)

View(ukraine_raw)

ukraine_finacial_aid <- ukraine_raw %>%
  group_by(`Fiscal Year`) %>%
  summarise(sum_aid_dollars = sum(`Current Dollar Amount`))

#stat identity allows you to plot bars that are the length of the mappints
#that I specify. 
ukraine_finacial_aid %>%
ggplot(aes(x=`Fiscal Year`,y=sum_aid_dollars)) +
  geom_bar(stat='identity')


ukraine_finacial_aid %>%
  filter(`Fiscal Year` >= 2000) %>%
  ggplot(aes(x=`Fiscal Year`,y=sum_aid_dollars)) +
  geom_bar(stat='identity')

#change the theme
ukraine_finacial_aid %>%
  filter(`Fiscal Year` >= 2000) %>%
  ggplot(aes(x=`Fiscal Year`,y=sum_aid_dollars)) +
  geom_bar(stat='identity',fill = "#C88967") +
  scale_y_continuous(position = "right")+
  theme(panel.background = element_blank(),
        axis.line.x = element_line(color = "black"),
     
        
        )


#plot.background = element_rect(fill = "#EC4899", color = NA)