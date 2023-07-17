library(tidyverse)
library(scales)
library(ggtext)
ukraine_raw <- read_csv('data/results.csv')
colnames(ukraine_raw)
head(ukraine_raw)

#double check data type
glimpse(ukraine_raw)

View(ukraine_raw)

ukraine_finacial_aid <- ukraine_raw %>%
  group_by(`Fiscal Year`) %>%
  summarise(sum_aid_dollars = sum(`Current Dollar Amount`))

ukraine_finacial_aid

#stat identity allows you to plot bars that are the length of the mappints
#that I specify. 
ukraine_finacial_aid %>%
ggplot(aes(x=`Fiscal Year`,y=sum_aid_dollars)) +
  geom_bar(stat='identity')


ukraine_finacial_aid %>%
  filter(`Fiscal Year` >= 2000 & `Fiscal Year` < 2023) %>%
  ggplot(aes(x=`Fiscal Year`,y=sum_aid_dollars)) +
  geom_bar(stat='identity')



#disable scientific notation 
#options is a global variable
#https://pubs.wsb.wisc.edu/academics/analytics-using-r-2019/s-options.html
options(scipen = 999)

#change the theme

#notes for labels : https://rpubs.com/techanswers88/remove-scientific-notation-in-ggplot
#note** label_number_si is decapitated new doc in this blog post:https://www.tidyverse.org/blog/2022/04/scales-1-2-0/
#expand gets rid of padding between the axis and the panel
#note text https://wilkelab.org/ggtext/

#add line breaks to text udemy section 8 video 100

ukraine_finacial_aid %>%
  filter(`Fiscal Year` >= 2000  & `Fiscal Year` < 2023) %>%
  ggplot(aes(x=`Fiscal Year`,y=sum_aid_dollars,aph)) +
  geom_bar(stat='identity',fill = "#C88967") +
  scale_y_continuous(position = "right",labels = label_number(scale_cut = cut_short_scale()),
                     breaks=seq(0,14000000000,2000000000),
                     expand = expansion(0))+
  scale_x_discrete(expand = expansion(0.005)) +
  labs(title = 'The Brief',
       subtitle='**U.S Foreign Aid to Ukraine** <br>The $12 billion in traditional foreign aid Congrees allocated for Ukraine last week in 10<br> times more than the assistance fhe country was given in the 2020 fiscal year.',
       caption = 'By The New York Times <br><br>  Source: ForeginAssistance.gov The new bill may include funding not covered in the historical data,<br> which is adjusted to 2020 dollars. Data not available for fiscal year 2021') +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(color = "black"),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        plot.title = element_text(face = "bold"),
        plot.caption = element_markdown(),
        plot.subtitle =   element_markdown(lineheight = 1.2)
        
  ) 

#https://stackoverflow.com/questions/28979622/ggplot-transparency-on-individual-bar
#https://stackoverflow.com/questions/68729271/why-cant-i-map-different-alpha-values-for-different-bars-in-ggplot2geom-col

ukraine_finacial_aid_alpha = ukraine_finacial_aid


ukraine_finacial_aid_alpha <- ukraine_finacial_aid_alpha %>%
  filter(`Fiscal Year` >= 2000  & `Fiscal Year` < 2023) %>%
  mutate(my_alpha = ifelse(`Fiscal Year` == 2022,1,0.3))


ukraine_finacial_aid_alpha%>%
  ggplot(aes(x=`Fiscal Year`,y=sum_aid_dollars,fill=`Fiscal Year`))+
  geom_bar(stat='identity',fill = "#C88967",alpha = ukraine_finacial_aid_alpha$my_alpha)+
  scale_y_continuous(position = "right",labels = label_number(scale_cut = cut_short_scale()),
                     breaks=seq(0,14000000000,2000000000),
                     expand = expansion(0))+
  scale_x_discrete(expand = expansion(0.005)) +
  labs(title = 'The Brief',
       subtitle='**U.S Foreign Aid to Ukraine** <br>The $12 billion in traditional foreign aid Congrees allocated for Ukraine last week in 10<br> times more than the assistance fhe country was given in the 2020 fiscal year.',
       caption = 'By The New York Times <br><br>  Source: ForeginAssistance.gov The new bill may include funding not covered in the historical data,<br> which is adjusted to 2020 dollars. Data not available for fiscal year 2021') +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(color = "black"),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        plot.title = element_text(face = "bold"),
        plot.caption = element_markdown(),
        plot.subtitle =   element_markdown(lineheight = 1.2)
        
  ) 

#plot.background = element_rect(fill = "#EC4899", color = NA)