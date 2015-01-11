# file name we're expecting in the same directory as this script
file <- "exdata-data-household_power_consumption.zip"
extractedFile <- "household_power_consumption.txt"

# download the file if necessary (shouldn"t be)
if (!file.exists(file)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl", destfile=file)
}

# extract the data in the current directory
if (!file.exists(extractedFile)) {
  unzip(file, files = NULL, list = FALSE, overwrite = TRUE,
        junkpaths = FALSE, unzip = "internal",
        setTimes = FALSE)
}

# don't do anything if the data frame is already loaded
if(!("sub" %in% ls())) {

  hpc <- read.csv(extractedFile, sep=";", header=TRUE, na.strings="?", colClasses = c(rep("character", 2), rep("numeric", 7)))
  
  # cast the Date column and replace
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  
  # add a date time
  hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
  
  # subset to desired time range
  sub <- subset(hpc, hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02")
}