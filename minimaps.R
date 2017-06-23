#From R Bloggers 
#https://www.r-bloggers.com/the-tile-grid-map-for-canada/

library(tidyverse)
library(viridis)
canada <- tribble(
  ~province, ~code, ~x, ~y,
  "Yukon", "YK", 1, 3,
  "British Columbia", "BC", 1, 2, 
  "Northwest Territories", "NW", 2, 3, 
  "Alberta", "AB", 2, 2, 
  "Nunavut", "NU", 3, 3, 
  "Saskatchewan", "SK", 3, 2,
  "Manitoba", "MB", 4, 2, 
  "Ontario", "ON", 5, 1,
  "Quebec", "QC", 6, 2, 
  "Prince Edward Island", "PE", 7, 3, 
  "New Brunswick", "NB", 7, 2,
  "Newfoundland and Labrador", "NL", 8, 3, 
  "Nova Scotia", "NS", 8, 1
)
df <- tibble(
  province = c("Ontario", "British Columbia", "Alberta", "Manitoba", "Nova Scotia"), 
  `Fake Data` = c(10, 4, 3, 6, 0)
)
df
canada %>% 
  left_join(df, by = "province") %>% 
  ggplot(aes(x, y)) + 
  geom_tile(aes(fill = `Fake Data`)) + 
  geom_text(aes(label = code), color = "white") + 
  coord_fixed(ratio = 1) + 
  theme(
    panel.background = element_blank(),
    panel.grid = element_blank(), 
    axis.title = element_blank(), 
    axis.text = element_blank(), 
    axis.ticks = element_blank()) + 
  scale_fill_viridis(na.value = "#E1E1E1", option = "D", begin = 0.2, end = 0.8)

#instructions using minimap built in dataset
#https://github.com/seankross/minimap/blob/master/README.md
library(minimap)
vignette("minimap")


determine_color <- function(status){
  if(status == "bbs")
    "#FFE597"
  else if(status == "nl")
    "#F1F1F0"
  else if (status == "dis")
    "#D0C7B9"
  else if(status == "bbca")
    "#FDC471"
  else
    "#817972" 
}
ssm$color <- as.character(sapply(ssm$Status, determine_color))
ssm_2008 <- ssm[ssm$Year == 2008, ]
miniusa(ssm_2008$State, state_colors = ssm_2008$color, state_names = TRUE,
        state_name_colors = rep('white', 51))
title(main = "Legal Status in 2008", line = -1)

head(ssm)
old_mai <- par()$mai
par(mai = c(0, 0, .75, .5), mfrow = c(2, 4))

for(i in 2008:2015){
  one_year <- ssm[ssm$Year == i,]
  miniusa(one_year$State, state_colors = one_year$color, state_names = FALSE)
  title(main = i, line = -2)
}

mtext("Legal Status of Gay Marriage Over Time", outer = TRUE, side = 3, line = -2)

par(mai = old_mai, mfrow = c(1, 1))