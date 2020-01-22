# soil moisture data cleaning script. 
require(tidyverse)

# bring in bess which was at HMC 7102
bess <- read.csv("./data/soilmoisture/bess_uncal.csv")

# Rename a column in R
names(bess)[1] <- "datetime"
str(bess)

# lets move datetime to a good format
bess$datetime <- strptime(x = as.character(bess$datetime),
                           format = "%Y-%m-%d %H:%M")


bess$datetime <- as.POSIXct(bess$datetime, 'EST')

# let's make clean
gather(key = "flower_att", value = "measurement", -Species)

# let's assign this so we don't lose it just in case
bess.og <- bess
bess %>%
  gather(key = "depth", value = "theta", -datetime) -> bess

# for bess which is at 7102 
# port_1 = 60cm
# port_2 = 15cm
# port_3 = 30cm
# I think lol
bess$depth <- recode(bess$depth, port_1 = "60cm")
bess$depth <- recode(bess$depth, port_2 = "15cm")
bess$depth <- recode(bess$depth, port_3 = "30cm")

require(ggplot2)
x11()
ggplot(bess, aes(x = datetime, y = theta)) + 
  geom_line(aes(color = depth), size = 0.5) +
  # scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  ylab("Uncalibrated Soil Mositure")+
  theme_minimal()