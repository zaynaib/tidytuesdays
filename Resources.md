- How to Read in excel data?

http://www.sthda.com/english/wiki/reading-data-from-excel-files-xls-xlsx-into-r

- What does the janitor package do?

- What is tidy data?

https://r4ds.had.co.nz/tidy-data.html

Code heavy version of tidy data paper : https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html


#What are the principals of tidy data

# There are three interrelated rules which make a dataset tidy:
  
# 1. Each variable must have its own column.
# 2. Each observation must have its own row.
#3. Each value must have its own cell.

Put each dataset in a tibble.
Put each variable in a column.

## Tidy Data tutorial links to courses

https://github.com/swirldev/swirl_courses
http://statseducation.com/Introduction-to-R/


## Tidyr Functions

- Gather (wide to long)

column names the represent what we would like to have as data values.

data is the dataframe you are working with.
key is the name of the key column to create.
value is the name of the value column to create.

tidy_pop %>% gather("year","population",-1)




- Spread

We have a data frame where some of the rows contain information that is really a variable name. This means the columns are a combination of variable names as well as some data.

(long to wide)

Ex. Dataset
library - tidyverse
dataset - population
population %>% spread(year, population)


- Separate

data is the data frame of interest.
col is the column that needs to be separated.
into is a vector of names of columns for the data to be separated into to.
sep is the value where you want to separate the data at.

ex:
table3 %>%
    separate(rate, c("cases", "population"), sep="/")

source: 
http://statseducation.com/Introduction-to-R/modules/tidy%20data/separate/


- Unite

### top functions to know about R

https://willhipson.netlify.app/post/dplyr_across/dplyr_across/
https://www.youtube.com/watch?v=NDHSBUN_rVU&t=114s

https://www.youtube.com/watch?v=6fEowYTlNT8