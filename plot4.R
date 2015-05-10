if(!file.exists("household_power_consumption.txt")){
      download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", method="auto")
      unzip("power.zip")
}
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- data[data$Date =="1/2/2007" | data$Date == "2/2/2007",]
data$datetime <- paste(data$Date, data$Time, sep=", ")
data$datetime <- strptime(data$datetime, format="%d/%m/%Y, %H:%M:%S")
library(datasets)
png("plot4.png", height=480, width=480, units="px")
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,0,0))
with(data, {
      plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
      plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
      lines(datetime, Sub_metering_2, col="red")
      lines(datetime, Sub_metering_3, col="blue")
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")
      plot(datetime, Voltage, type="l")
      plot(datetime, Global_reactive_power, type="l")
      
}     
     )
dev.off()