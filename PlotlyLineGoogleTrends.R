library(xts)
library(plotly)
alcohol <- read.csv("multiTimeline.csv", header = T, stringsAsFactors = F)
head(alcohol)
str(alcohol)
#convert date to xts so can plot with plotly
alcohol$Week <- as.Date(alcohol$Week, format = "%m/%d/%Y")
time_series <- xts(alcohol, order.by = alcohol$Week)
head(time_series)
p <- plot_ly(alcohol, x = alcohol$Week, y = alcohol$wine, name = "Wine Interest", type = "scatter", mode = "lines") %>% 
  add_trace(y = alcohol$Beer, name = "Beer Interest", mode = "lines")
p

