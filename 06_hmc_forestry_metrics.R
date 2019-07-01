#06 species stuff
require(plyr)
require(dplyr)
require(tidyverse)
require(ggplot2)
require(ggridges)
require(viridis)

# import data
dbh <- read.csv("./data/hmc_old_plots_dbh.csv")

names(dbh)[1] <- "stemid"
names(dbh)[2] <- "plotid"
names(dbh)[4] <- "species"
names(dbh)[5] <- "azimuth"
names(dbh)[6] <- "distance"
# subset
dbh %>%
  select(stemid, plotid, species, azimuth, distance, D09) -> df

df <-na.omit(df)

#  y <- if(x > 0) 5 else 6
if(df$species == "Tsca"){
  df$type <- "HEMLOCK"} else {if(client != "Tsca"){
    df$type <- "OTHER BOI"
     }
  }
df$type[which(df$species == "Tsca")] <- "Hemlock"
df$type[which(df$species != "Tsca")] <- "Other Boi"


df$type <- as.factor(df$type)
df$plotid <- as.factor(df.plotid)

x11()
ggplot(df, aes(x = D09, y = as.factor(plotid), fill = as.factor(plotid)))+ 
  geom_density_ridges(aes(alpha = .2), scale = 2)+
  theme_classic()+
  ylab("")+
  xlab("DBH (cm)")

x11()
ggplot(df, aes(x = D09, y = as.factor(plotid), fill = as.factor(species)))+ 
  geom_density_ridges(aes(alpha = 1), scale = 2)+
  theme_classic()+
  ylab("")+
  xlab("DBH (cm)")
#####
# stem maps
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

df$x <- df$distance * sin(df$azimuth * (pi / 180)) #convert bearing to radians
df$y <- df$distance * cos(df$azimuth * (pi / 180)) #convert bearing to radians
#stem$label <- ifelse( stem$fate == "kill", emoji('smile'), emoji('skull_and_crossbones'))
#add emoji
hist(stem$dbh)

# sort by plot
df %>%
  filter(plotid == 7088) -> df.7088
# stem map
x11(height = 5, width = 6)
ggplot(data = df.7088, aes(x = x, y = y, size = D09, color = species)) +
  geom_point(alpha = 1)+
  #scale_colour_manual(values=viridis)+
  # geom_text(aes(label=Nr),hjust=0, vjust=0)+
  # guides(fill=FALSE, alpha=FALSE, size=FALSE)+
  theme_classic()

####
# plot summary
df %>%
  count(species, plotid) -> df.sums
  group_by(plotid) %>%
  summarise(total_n <- count()
  
table(df$species, df$plotid)


##############
circular2xy <- function(distance, bearing, center.x = 0, center.y = 0) {
  
  #check inputs
  if(!is.numeric(distance) | !is.numeric(bearing)) stop("Input data not numeric")
  if(any(bearing > 360)) stop("bearing value(s) exceed 360")
  
  bearing.rad <- bearing * (pi / 180) #convert bearing to radians
  delta.x <- distance * sin(bearing.rad)
  delta.y <- distance * cos(bearing.rad)
  tree.x <- round(center.x + delta.x,2)
  tree.y <- round(center.y + delta.y,2)
  return(data.frame(x=tree.x,y=tree.y))
}