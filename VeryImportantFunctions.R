#Reading in a csv with blanks and want to convert them to NA first
newRain <- read.csv("NewRainWithBlanks.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = c(""))
head(newRain)
#A graph of the missing values
library(Amelia)
library(Rcpp)
missmap(newRain, main = "Missing values vs observed")
sapply(newRain, function(x) sum(is.na(x)))
#a way to deal with NA is to substitute the mean
newRain$PRCP[is.na(newRain$PRCP)] <- mean(newRain$PRCP, na.rm = T)
sapply(newRain, function(x) sum(is.na(x)))
#another way to select columns
newRain <- subset(newRain,select=c(2,3,6))
#selecting columns
newRain <- newRain[10772:11969,]
#Format date
newRain[ , 2 ] <- ymd(newRain[, 2])
head(newRain)
#count and itemize the the NA
sapply(newRain, function(x) sum(is.na(x)))
#partition for logistic regression
rainTrain <- newRain[1:730, ]


head(rainTrain)
