#Daily Max Temp counts for Big Bay Weatherstation
require(plyr)
require(dplyr)
require(ggplot2)
heat <- read.csv("./data/heat_days.csv")

#
x11()
ggplot(heat, aes(x = year, y = no_heat_days ))+
  geom_point(size = 6, shape = 21, color = "black", fill = "red")+
  theme_classic()+
  xlab("")+
  ylab("No. of Extreme Heat Days in July")+
  geom_smooth(method = "loess", se = FALSE)+
  scale_x_continuous(breaks=seq(1990,2020,5))+
  theme(axis.title = element_text(size=20, color = "black"),
        axis.text = element_text(size=14, color = "black"))

#model
lm.heat <- lm(year ~ no_heat_days, data = heat)