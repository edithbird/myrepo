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
rainValid <- newRain[731:1198,]
#partition for neural networks
rain.ts <- ts(newRain$PRCP, start = c(2014,1), frequency = 360)
validLength <- 467
trainLength <- length(rain.ts) - validLength
rainTrainWindow <- window(rain.ts, end = c(2014, trainLength))
rainValidWindow <- window(rain.ts, start = c(2014, trainLength + 1))
rainNN <- nnetar(rainTrainWindow)
rainNN
summary(rainNN$model[[1]])
rainPredict <- forecast(rainNN, h = validLength)
head(rainPredict$mean)
accuracy(rainPredict, rainValidWindow)

#horizontal line on a plot
plot(rainPredict$mean)
plot(rainPredict$residuals)
abline(h = 2)
abline(v = 2015)

setwd( "/Users/Chris Iyer/Documents/Assignment5Predictive/")
air <- read.csv("AirTravel.csv", header = TRUE, stringsAsFactors = F)
head(air)
range(air$Air)
tail(air)
airTS <- ts(air$Air, start=c(1990, 1), frequency=12)
validLength <- 12
trainLength <- length(airTS) - validLength
airTrain <- window(airTS, end = c(1990, trainLength))
airValid <- window(airTS, start = c(1990, trainLength + 1))
air.nn <- nnetar(airTrain, p = 11)
air.nn
summary(air.nn$model[[1]])
air.ets <- ets(airTrain, model = "ZZZ", restrict = F)
air.ets
nnForecacst <- forecast(air.nn, h = validLength)
etsForecast <- forecast(air.ets, h = validLength)

yrange <- range(airTS)
plot(c(1990, 2001), yrange, type="n", xlab="Year",  ylab="Air Revenue Passenger Miles (millions)", bty="l", xaxt="n", yaxt="n")

# Add the time series air
lines(airTS, bty="l")

# Add the x-axis
axis(1, at=seq(1990,2001,1), labels=format(seq(1990,2001,1)))

# Add the y-axis
axis(2, at=seq(29500000,68000000,5000000), labels=format(seq(29.5,68,5.0)), las=2)
lines(nnForecacst$mean, col = "blue")
lines(etsForecast$mean, col = "deeppink4", lwd = 2, lty  = 2)
accuracy(nnForecacst, airValid)
accuracy(etsForecast, airValid)
legend(1990,68000000, c("ARPM", "Neural Network MAPE = 5.33", "Smoothing MAPE = 6.19"), lty=c(1,1,2), col=c("black", "blue", "deeppink4"), lwd=c(1,1,2), bty="n")


#cool data sets and reading in string columns
library(datasets)
library(WDI)
head(HairEyeColor)
names(HairEyeColor)
names(mtcars)
str(HairEyeColor)
dim(HairEyeColor)
#update world bank
WDIcache()
WDIsearch("lifeexpectantcy")
dat = WDI(indicator='NY.GDP.PCAP.KD', country=c('MY','AG','AR'), start=1960, end=1962)
dat
crash <- read.csv("airAccs.csv", header = T, stringsAsFactors = F)
crash[c(4500:4525),c(2,4)]
dim(crash)
library(dplyr)
crash %>% filter(grepl("Japan",operator))
