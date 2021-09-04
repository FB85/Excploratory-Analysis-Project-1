#getting data
data <- read.csv("household_power_consumption.txt", sep = ";")
datasub <- subset(data,data$Date =="1/2/2007" | data$Date =="2/2/2007")

#preparing data
datasub$Date <- as.Date(datasub$Date, format="%d/%m/%Y")
datasub$Time <- strptime(datasub$Time, format="%H:%M:%S")
datasub[1:1440,"Time"] <- format(datasub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
datasub[1441:2880,"Time"] <- format(datasub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#displaying charts
par(mfrow=c(2,2))
par(mar = c(4,4,2,1))
plot(datasub$Time,as.numeric(as.character(datasub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(datasub$Time,as.numeric(as.character(datasub$Voltage)), type="l",xlab="datetime",ylab="Voltage")
plot (datasub$Time,datasub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
legend("topright" , lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)
lines(datasub$Time,datasub$Sub_metering_1)
lines(datasub$Time,datasub$Sub_metering_2, col = "red")
lines(datasub$Time,datasub$Sub_metering_3, col = "blue")
plot(datasub$Time,as.numeric(as.character(datasub$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")

#creating png
with(datasub, {
  png(filename = "plot4.png")
  par(mfrow=c(2,2))
  par(mar = c(4,4,2,1))
  plot(datasub$Time,as.numeric(as.character(datasub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(datasub$Time,as.numeric(as.character(datasub$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot (datasub$Time,datasub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  legend("topright" , lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)
  lines(datasub$Time,datasub$Sub_metering_1)
  lines(datasub$Time,datasub$Sub_metering_2, col = "red")
  lines(datasub$Time,datasub$Sub_metering_3, col = "blue")
  plot(datasub$Time,as.numeric(as.character(datasub$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
  dev.off()
})