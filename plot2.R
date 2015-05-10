if(!file.exists("household_power_consumption.txt")){
      download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", method="auto")
      unzip("power.zip")
}
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- data[data$Date =="1/2/2007" | data$Date == "2/2/2007",]
data$datetime <- paste(data$Date, data$Time, sep=", ")
data$datetime <- strptime(data$datetime, format="%d/%m/%Y, %H:%M:%S")
library(datasets)

plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png, file="plot2.png", width = 480, height= 480, units = "px")
dev.off()