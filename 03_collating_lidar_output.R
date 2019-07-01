# This script is a helper script that collates output from CSC processed w/ forestr

# set your output directory
output_directory <- "./output/output/"

#
library(dplyr)
library(readr)
df <- list.files(path = output_directory, full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows

df <- data.frame(df)
write.csv(df, "forte_pcl_2018.CSV")
