#title: "matrices and dataframes"
#author: "Sushen S Jamwal"
#date: "July 27, 2019"


x <- 1:5
y <- 6:10
z <- 11:15
#create a matrix: x, y, z columns
cbind(x, y, z) 
#x, y, z rows
rbind(x, y, z) 


#matrix with both number and charactors will be all charactors instead
cbind(c(1, 2, 3, 4, 5),
      c("a", "b", "c", "d", "e")) 

matrix(data = 1:10,
       nrow = 5,
       ncol = 2)

#2 rows and 5 columns, fill by row
matrix(data = 1:10,
       nrow = 2,
       ncol = 5,
       byrow = TRUE) 

#create survey data frame
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23))
str(survey)

#without factors DF
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23),
                     stringsAsFactors = FALSE)

head(ChickWeight)
#head, tail, view function to review data frame

#changing colummn names
names(survey)[1] <- "participant.number"
survey

names(survey)[names(survey) == "age"] <- "years"
survey

#Create a subsettted datafram
oj <- subset(x = ToothGrowth,
             subset = supp == "OJ") 
mean(oj$len)


##Vectors

typeof(letters) #determin data tyoe
typeof(1:10)

#determine length
x <- list("a", "b", 1:10)
length(x)

#output: -inf, nan, inf
c(-1, 0, 1) / 0

x <- sample(20, 100, replace = TRUE)
y <- x > 10
sum(y)

sample(10) + 100


x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]

x <- c(abc = 1, def = 2, xyz = 5)
x[c("xyz", "def")]

x <- 1:10
attr(x, "greeting")
#named list of vectors attached to objects
attr(x, "greeting") <- "Hi!"
attr(x, "farewell") <- "Bye!"
attributes(x)
