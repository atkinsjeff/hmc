# pcl work
require(forestr)


# lines check
#this script, thanks in part to the indomitable Ben Bond-Lamberty, error checks which files have missing lines.
og <- getwd()
setwd("./data/pcl")

files <- list.files(pattern = "*.CSV", full.names = TRUE)

for(i in seq_along(files)) {
  filedata <- readLines(files[i])
  lines_to_skip <- min(which(filedata != "")) - 1
  cat(i, files[i], lines_to_skip, "\n")
  x <- read.csv(files[i], skip = lines_to_skip)
}

setwd(og)


# run them bois
data_dir <- "./data/pcl"
process_multi_pcl(data_dir, marker.spacing = 10, user_height = 1.1)


## set your output directory
output_directory <- "./output/output/"

#
library(dplyr)
library(readr)
df <- list.files(path = output_directory, full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows

df <- data.frame(df)
write.csv(df, "hmc_pcl.CSV")