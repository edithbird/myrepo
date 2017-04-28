#Reading in a csv with blanks and want to convert them to NA first
newRain <- read.csv("NewRainWithBlanks.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = c(""))
head(newRain)
#A graph of the missing values
library(Amelia)
library(Rcpp)
missmap(newRain, main = "Missing values vs observed")
sapply(newRain, function(x) sum(is.na(x)))
