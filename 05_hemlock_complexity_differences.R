# maps

keith <- read.csv("hmc_plot_data_20190611.csv")

library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(plyr)
library(dplyr)

keith$plotid <- as.factor(keith$plotid)

# graphing
x11()
ggplot(keith, aes(x = prop.hemlock, y = rugosity, color = plotid))+
  geom_point(size = 4)+
  theme_classic()

x11()
ggplot(keith, aes(x = prop.hemlock, y = max.can.ht, color = plotid))+
  geom_point(size = 4)+
  theme_classic()


x11()
ggplot(keith, aes(x = prop.hemlock, y = cover.fraction, color = plotid))+
  geom_point(size = 4)+
  theme_classic()+
  ylab("Gap Fraction")+
  xlab("Proportion of Hemlock")

x11()
ggplot(keith, aes(x = mean.vai, y = cover.fraction, color = plotid))+
  geom_point(size = 4)+
  theme_classic()+
  ylab("Gap Fraction")+
  xlab("VAI")

x11()
ggplot(keith, aes(x = max.ht, y = plotid, fill = plotid))+ 
  geom_density_ridges(aes(alpha = 1), scale = 2)+
  theme_classic()+
  ylab("")+
  xlab("height")

hist(keith$max.can.ht)

keith %>%
  filter(plotid == 7095) -> a

keith %>%
  filter(plotid == 7104) -> b

keith %>%
  filter(plotid == 7093) -> c

df <- rbind(a,b,c)


species$prop.hemlock <- species$Tsca / species$Grand.Total

keith$prop.hemlock <- species$prop.hemlock[match(keith$plotid, species$plotid)]

keith %>%
  select(plotid, prop.hemlock, rugosity)
