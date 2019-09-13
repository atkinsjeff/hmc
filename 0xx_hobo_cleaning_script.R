# compiling temp data

two <- read.csv("./data/hobo/12.csv", skip = 1)

two$site_id <- as.factor("HMC")
two$ht <- as.factor("two")

# five m
five <- read.csv("./data/hobo/11.csv", skip = 1)

five$site_id <- as.factor("HMC")
five$ht <- as.factor("five")

# eight m
eight <- read.csv("./data/hobo/10.csv", skip = 1)

eight$site_id <- as.factor("HMC")
eight$ht <- as.factor("eight")

dataframe1$datetime <- strptime(x = as.character(dataframe1$datetime),
                                format = "%d/%m/%Y %H:%M")

