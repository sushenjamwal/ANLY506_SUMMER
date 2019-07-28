#title: "Exploratory Data Analysis Checklist"
#author: "Sushen S Jamwal"
#date: "July 27, 2019"

getwd()

setwd("D:/250GB__First/ANLY506/Git/ANLY-506/")
read.csv("US EPA data 2017.csv")

install.packages("readr")
library(readr)
install.packages("dplyr")
library(dplyr)

#read csv and save to epa
epa <- read_csv("US EPA data 2017.csv")

#check columns and rows
nrow(epa)
ncol(epa)

#a summary of data
str(epa) 
#look up the top and bottom of data with head and tail function
head(epa[, c(6:7, 10)]) 
tail(epa[, c(6:7, 10)])


table(epa) #file is too large to run
filter(epa, Time.Local == "13:14") %>% 
  +         select(State.Name, County.Name, Date.Local, 
                   +                Time.Local, Sample.Measurement)

#provides minimum, mean. maximum, 1st and 3rd quantile values
unique(epa$`Method Name`)
summary(epa$`Method Name`)
summary(epa$`Arithmetic Mean`)

quantile(epa$`Arithmetic Mean`, seq(0, 1, 0.1)) 

ranking <- group_by(epa, State.Name, County.Name) 
+         summarize(epa = mean(epa$`Arithmetic Mean`)) 
+         as.data.frame 
+         arrange(desc(epa))


epa <- mutate(epa, Date.Local = as.Date(Date.Local))