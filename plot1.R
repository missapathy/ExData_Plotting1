if(!file.exists("household_power_consumption.txt")){
      download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", method="auto")
      unzip("power.zip")
}
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- subset(data, Date =="1/2/2007" | Date == "2/2/2007")

library(datasets)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col = "red", main="Global Active Power", breaks=15)
dev.copy(png, file="plot1.png", width = 480, height= 480, units = "px")
dev.off()
