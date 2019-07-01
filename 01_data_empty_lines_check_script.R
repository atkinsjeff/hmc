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