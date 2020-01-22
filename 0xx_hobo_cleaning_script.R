# compiling temp data
require(tidyverse)

####### this is for HMC plot 7104
two <- read.csv("./data/hobo/12.csv", skip = 1)

two$site_id <- as.factor("HMC")
two$ht <- as.factor("two")

two$datetime <- strptime(x = as.character(two[,2]),
                           format = "%y/%m/%d %H:%M:%S")

# five m
five <- read.csv("./data/hobo/11.csv", skip = 1)

five$site_id <- as.factor("HMC")
five$ht <- as.factor("five")

five$datetime <- strptime(x = as.character(five[,2]),
                           format = "%y/%m/%d %H:%M:%S")
# eight m
eight <- read.csv("./data/hobo/10.csv", skip = 1)

eight$site_id <- as.factor("HMC")
eight$ht <- as.factor("eight")

eight$datetime <- strptime(x = as.character(eight[,2]),
                                format = "%y/%m/%d %H:%M:%S")

df <- rbind(two, five, eight)

# adding plot information
df$plot_id <- as.factor(7104)

# Rename a column in R
names(df)[3] <- "T_air"

df %>%
  select(site_id, plot_id, ht, datetime, T_air) -> hmc.7104

hmc.7104 <- as.data.frame(hmc.7104)
hmc.7104$datetime <- as.POSIXct(hmc.7104$datetime, 'EST')

# this one subsets data to the time of interest. 
 hmc.7104x <- subset(hmc.7104, datetime <= as.POSIXct('2019-08-16 12:00:00'))
 hmc.7104y <- subset(hmc.7104x, datetime > as.POSIXct('2019-07-09 00:00:00'))

 # #this one is for making funky graphs 
 # hmc.7102x <- subset(hmc.7102, datetime >= as.POSIXct('2019-07-30 12:00:00'))
 # hmc.7102y <- subset(hmc.7102x, datetime <= as.POSIXct('2019-07-31 12:00:00'))
# Multiple line plot

require(ggplot2)
x11()
ggplot(hmc.7104y, aes(x = datetime, y = T_air)) + 
  geom_line(aes(color = ht), size = 0.5) +
  # scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  ylab("Air Temperature (C)")+
  theme_minimal()

#write.csv(hmc.7104y, "hmc_7104_air_temp.csv")

##############################################################
####### this is for HMC plot 7102
two <- read.csv("./data/hobo/5.csv", skip = 1)

two$site_id <- as.factor("HMC")
two$ht <- as.factor("two")

two$datetime <- strptime(x = as.character(two[,2]),
                         format = "%y/%m/%d %H:%M:%S")

# five m
five <- read.csv("./data/hobo/8.csv", skip = 1)

five$site_id <- as.factor("HMC")
five$ht <- as.factor("five")

five$datetime <- strptime(x = as.character(five[,2]),
                          format = "%y/%m/%d %H:%M:%S")
# eight m
eight <- read.csv("./data/hobo/9.csv", skip = 1)

eight$site_id <- as.factor("HMC")
eight$ht <- as.factor("eight")

eight$datetime <- strptime(x = as.character(eight[,2]),
                           format = "%y/%m/%d %H:%M:%S")

df <- rbind(two, five, eight)

# adding plot information
df$plot_id <- as.factor(7102)

# Rename a column in R
names(df)[3] <- "T_air"

df %>%
  select(site_id, plot_id, ht, datetime, T_air) -> hmc.7102

hmc.7102 <- as.data.frame(hmc.7102)
hmc.7102$datetime <- as.POSIXct(hmc.7102$datetime, 'EST')

# this one subsets data to the time of interest. 
hmc.7102x <- subset(hmc.7102, datetime <= as.POSIXct('2019-08-16 12:00:00'))
hmc.7102y <- subset(hmc.7102x, datetime > as.POSIXct('2019-07-09 00:00:00'))

# #this one is for making funky graphs 
# hmc.7102x <- subset(hmc.7102, datetime >= as.POSIXct('2019-07-30 12:00:00'))
# hmc.7102y <- subset(hmc.7102x, datetime <= as.POSIXct('2019-07-31 12:00:00'))
# Multiple line plot


#############################################

####### this is for CP/IP plot 9454
two <- read.csv("./data/hobo/13.csv", skip = 1)

two$site_id <- as.factor("IP")
two$ht <- as.factor("two")

two$datetime <- strptime(x = as.character(two[,2]),
                         format = "%y/%m/%d %H:%M:%S")

# five m
five <- read.csv("./data/hobo/15.csv", skip = 1)

five$site_id <- as.factor("IP")
five$ht <- as.factor("five")

five$datetime <- strptime(x = as.character(five[,2]),
                          format = "%y/%m/%d %H:%M:%S")
# eight m
eight <- read.csv("./data/hobo/18.csv", skip = 1)

eight$site_id <- as.factor("IP")
eight$ht <- as.factor("eight")

eight$datetime <- strptime(x = as.character(eight[,2]),
                           format = "%y/%m/%d %H:%M:%S")

df <- rbind(two, five, eight)

# adding plot information
df$plot_id <- as.factor(9454)

# Rename a column in R
names(df)[3] <- "T_air"

df %>%
  select(site_id, plot_id, ht, datetime, T_air) -> tom

tom <- as.data.frame(tom)
tom$datetime <- as.POSIXct(tom$datetime, 'EST')

# this one subsets data to the time of interest. 
tomx <- subset(tom, datetime <= as.POSIXct('2019-08-16 12:00:00'))
#tomy <- subset(tomx, datetime > as.POSIXct('2019-07-09 00:00:00'))

# #this one is for making funky graphs 
tomx <- subset(tom, datetime >= as.POSIXct('2019-07-30 12:00:00'))
tomy <- subset(tomx, datetime <= as.POSIXct('2019-07-31 12:00:00'))
# Multiple line plot

require(ggplot2)
x11()
ggplot(tomy, aes(x = datetime, y = T_air)) + 
  geom_line(aes(color = ht), size = 0.5) +
  # scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  ylab("Air Temperature (C)")+
  theme_minimal()+
  ggtitle("IP 9454")

write.csv(, "hmc_7102_air_temp.csv")

##################################################################
#############################################

####### this is for CP/IP plot deep plot, number unknown right now
two <- read.csv("./data/hobo/16.csv", skip = 1)

two$site_id <- as.factor("IP")
two$ht <- as.factor("two")

two$datetime <- strptime(x = as.character(two[,2]),
                         format = "%y/%m/%d %H:%M:%S")

# five m
five <- read.csv("./data/hobo/19.csv", skip = 1)

five$site_id <- as.factor("IP")
five$ht <- as.factor("five")

five$datetime <- strptime(x = as.character(five[,2]),
                          format = "%y/%m/%d %H:%M:%S")
# eight m
eight <- read.csv("./data/hobo/22.csv", skip = 1)

eight$site_id <- as.factor("IP")
eight$ht <- as.factor("eight")

eight$datetime <- strptime(x = as.character(eight[,2]),
                           format = "%y/%m/%d %H:%M:%S")

df <- rbind(two, five, eight)

# adding plot information
df$plot_id <- as.factor("deep_plot")

# Rename a column in R
names(df)[3] <- "T_air"

df %>%
  select(site_id, plot_id, ht, datetime, T_air) -> carl

carl <- as.data.frame(tom)
tom$datetime <- as.POSIXct(tom$datetime, 'EST')

# this one subsets data to the time of interest. 
#carlx <- subset(carl, datetime <= as.POSIXct('2019-08-16 12:00:00'))
#carly <- subset(carlx, datetime > as.POSIXct('2019-07-09 00:00:00'))

# #this one is for making funky graphs 
carlx <- subset(carl, datetime >= as.POSIXct('2019-07-30 12:00:00'))
carly <- subset(carlx, datetime <= as.POSIXct('2019-07-31 12:00:00'))
# Multiple line plot

require(ggplot2)
x11()
ggplot(carly, aes(x = datetime, y = T_air)) + 
  geom_line(aes(color = ht), size = 0.5) +
  # scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  ylab("Air Temperature (C)")+
  theme_minimal()+
  ggtitle("Deep Plot")


