# pcl structure script
require(ggplot2)
require(vegan)

df <- read.csv("hmc_pcl_clean.csv")

df$plotid <- as.factor(df$plotid)

x11()
ggplot(df, aes(x = rugosity, y = max.ht, color = plotid))+
  geom_point(size = 4)+
  theme_classic()+
  xlim(0,50)+
  ylim(0,50)


x11()
ggplot(df, aes(x = rugosity, y = mode.2, color = plotid))+
  geom_point(size = 4)+
  theme_classic()+
  xlim(0,50)+
  ylim(0,15)


x11()
ggplot(df, aes(x = plotid, y = rugosity))+
  geom_bar(colour="black", stat="identity")+
  theme_classic()+
  xlab("")+
  guides(fill=FALSE)
######

species <- read.csv("./data/hmc_old_plots_species_counts.csv")
head(species)

# fuck if i know why I have to do this
names(species)[1] <- "plotid"

#this should get richness
species$richness <- rowSums(species > 0)
plot.diversity <- species[,c("plotid", "Grand.Total", "richness")]


# get it ready for vegan
species[is.na(species)] <- 0

species %>%
  select(plotid:Ulam) -> species.wide
#

species.long <- gather(species.wide, key = "species", value = "no.species", -plotid)
species.long$plot.total <- species$Grand.Total[match(species$plotid, species.long$plotid)]
species.long$plot.prop <- species.long$no.species / species.long$plot.total

###
# Stacked
x11()
ggplot(species.long, aes(fill = species, y = plot.prop, x = as.factor(plotid))) + 
  geom_bar( stat="identity")

plot.diversity$simpsons  <- diversity(species[,2:18], index = "simpson")
plot.diversity$shannon <- diversity(species[,2:18], index = "shannon")

#write.csv(plot.diversity, "hmc_plot_diversity.csv")