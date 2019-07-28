#title: "Importing, saving, and managing data"
#author: "Sushen S Jamwal"
#date: "July 27, 2019"


ls()
#Removes all objects in the workspace
rm(list = ls()) 
load(file = "data")	
write.table(x, file = "mydata.txt", sep)

#current working dir is: D:/250GB__First/ANLY506/Git/ANLY-506/
getwd()

study1.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))

score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = study1.df)

study1.htest <- t.test(score ~ sex, 
                       data = study1.df)

# Save the objects as .RData file, saved in my current working directory
save(study1.df, score.by.sex, study1.htest,
     file = "D:/250GB__First/ANLY506/Git/ANLY-506/study1.RData")


# Remove huge.df from workspace
rm(huge.df)

#save objects as a .txt file
write.table(x = pirates,
            file = "pirates.txt", 
            sep = "\t")#Make the columns tab-delimited


#read a .txt file
mydata <- read.table(file = 'data/mydata.txt',    # file is in a data folder in my working directory
                     sep = '\t',                  # tab--delimited
                     header = TRUE,               # the first row of the data is a header row
                     stringsAsFactors = FALSE)


#read txt file from website
fromweb <- read.table(file = 'https://moodle.harrisburgu.edu/pluginfile.php/628720/mod_resource/content/1/table.txt',
                      sep = '\t',
                      header = TRUE)
ls(fromweb)