##############################################################
##
## Exploratory Data Analysis
## Course Project 1 _ Plot3
## 
##############################################################
##
##  1. Create the directory
##
if (!file.exists("hpc_data")) {
  dir.create("hpc_data")
}
#
##  2. Name the files and the directory
datadir <- "./hpc_data"
destfile <- "./hpc_data/household_power_consumption.zip"
fileurl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##
##  3. Download and unzip the datafile
download.file(fileurl, destfile=destfile)
unzip(destfile, exdir=datadir)
#
## 4. Check if the downloaded and unzipped files exist in the file list
filelist <- list.files(datadir)
#
## 5. The following step is not necessary, but I prefer it this way.
##    I know, I created a new directory and there should be only two files in it.
##    I get the ".txt" file.
##
datafile <- filelist[1]
##
## 6. I check the memory usage.
library(pryr)
object_size(read.table(datafile))
mem_used()
## 7. I read the file in.
data <- read.table(datafile, sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")
##
## 8. Convert the Date column to Date type.
class(data$Date)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
class(data$Date)
##
## 9. I use dplyr package to filter the rows I want.
library(dplyr)
datafiltered <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")
##
##############################################################
##
## Exploratory Data Analysis
## Course Project 1 _ Plot1
## 
##############################################################
##
##  1. Create the directory
##
if (!file.exists("hpc_data")) {
  dir.create("hpc_data")
}
#
##  2. Name the files and the directory
datadir <- "./hpc_data"
destfile <- "./hpc_data/household_power_consumption.zip"
fileurl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##
##  3. Download and unzip the datafile
download.file(fileurl, destfile=destfile)
unzip(destfile, exdir=datadir)
#
## 4. Check if the downloaded and unzipped files exist in the file list
filelist <- list.files(datadir)
#
## 5. The following step is not necessary, but I prefer it this way.
##    I know, I created a new directory and there should be only two files in it.
##    I get the ".txt" file.
##
datafile <- filelist[1]
##
## 6. I check the memory usage.
library(pryr)
object_size(read.table(datafile))
mem_used()
## 7. I read the file in.
data <- read.table(datafile, sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")
##
## 8. Convert the Date column to Date type.
class(data$Date)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
class(data$Date)
##
## 9. I use dplyr package to filter the rows I want.
library(dplyr)
datafiltered <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")
##
## 10. I create a date/time column formatted properly.
datetime <- paste(datafiltered$Date, datafiltered$Time)
datetime <- as.POSIXct(datetime, tz="GMT")
datafiltered$datetime <- datetime
#
## 11. The 3rd Plot
##
plotfile3 <- "./hpc_data/plot3.png"
png(filename=plotfile3, width=480, height=480, units="px")
plot(datafiltered$datetime, datafiltered$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datafiltered$datetime, datafiltered$Sub_metering_2, type="l",col="red")
lines(datafiltered$datetime, datafiltered$Sub_metering_3, type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()
##
