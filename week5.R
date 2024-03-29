#title: "Tidy Data"
#author: "Sushen S Jamwal"
#date: "July 27, 2019"


library(tidyverse)
library(ggplot2)


table1
table2
table3
table4a
table4b

table1 %>% 
  mutate(rate = cases / population * 10000)  
table1 %>% 
  count(year, wt = cases)


#ggplot() to construct the initial plot object
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

#spread() takes two columns (key & value), and spreads into multiple columns
#spread function makes long data wider
table2 %>%
  spread(key = type, value = count) 


#Excercise

stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`)


people <- tribble(
  ~name,             ~key,    ~value,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
gather(people)

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
gather(preg)

#separate() will split at positions provided. 
#Positive values start at 1 on the far-left of the strings; 
#negative value start at -1 on the far-right of the strings.
table3 %>% 
  separate(rate, into = c("cases", "population")) #convert to better types 
table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)


#na.rm=true to turn explicit missing values implicit
stocks %>% 
  spread(year, return) %>% 
  gather(year, return, `2015`:`2016`, na.rm = TRUE)

