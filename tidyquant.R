library(tidyquant)
library(lubridate)
library(TTR)
library(dplyr)

#For instructions: http://www.business-science.io/code-tools/2017/01/01/tidyquant-introduction.html
from <- today() - years(1)
VTSAX <- tq_get("VTSAX", get = "stock.prices", from = from)

VTSAX
tq_mutate_fun_options() %>% 
  str()
VTSAX <-  tq_mutate(VTSAX, select = close, mutate_fun = SMA, n = 15)
VTSAX <-  tq_mutate(VTSAX, select = close, mutate_fun = SMA, n = 50)


VTSAX <- VTSAX %>% rename(Close = close, SMA.15 = SMA, SMA.50= SMA.1)


head(VTSAX)
my_palette <- c("black", "blue", "red")
VTSAX %>% select(date, Close, SMA.15, SMA.50) %>%
  gather(key = type, value = price, Close:SMA.50) %>% 
  ggplot(aes(x = date, y = price, col = type)) + 
  geom_line() + 
  scale_colour_manual(values = my_palette) + 
  theme(legend.position = "bottom") + 
  ggtitle("Simple Moving Averages are a Breeze with tidyquant") + 
  xlab("") + 
  ylab("Stock Price")
