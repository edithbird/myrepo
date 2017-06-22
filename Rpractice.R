#https://juliasilge.com/blog/you-must-allow-me/
library(readr)
library(stringr)
rawPandP <- read_lines("PandP.txt", skip = 30, n_max = 13032)
PandP <- character()
for (i in seq_along(rawPandP)){
  if(i%%10 == 1) PandP[ceiling(i/10)] <- str_c(rawPandP[i], 
                                               rawPandP[i+1], 
                                               rawPandP[i+2], 
                                               rawPandP[i+3],
                                               rawPandP[i+4], 
                                               rawPandP[i+5], 
                                               rawPandP[i+6], 
                                               rawPandP[i+7], 
                                               rawPandP[i+8], 
                                               rawPandP[i+9], sep = " " )
  
  
}
library(syuzhet)
get_nrc_sentiment("I love dogs")
PandPnrc <- cbind(linenumber = seq_along(PandP), get_nrc_sentiment(PandP))
PandP$volume <- "Volume I"
PandPnrc[grep("Chapter 24", PandP):length(PandP), 'volume']
PandPnrc[grep("Chapter 43", PandP):length(PandP), 'volume']
PandPnrc$volume <- as.factor(PandPnrc$volume)
PandPnrc$linenumber[PandPnrc$volume == "Volume II"] <- seq_along(PandP)
PandPnrc$linenumber[PandPnrc$volume == "Volume III"] <- seq_along(PandP)
library(dplyr)
library(reshape2)
names(PandPnrc)
PandPnrc$negative <- -PandPnrc$negative
posneg <- PandPnrc %>% select(linenumber, volume, positive, negative) %>% 
  melt(id = c("linenumber", "volume"))


