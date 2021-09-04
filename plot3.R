#getting data
data <- read.csv("household_power_consumption.txt", sep = ";")
datasub <- subset(data,data$Date =="1/2/2007" | data$Date =="2/2/2007")

#preparing data
datasub$Date <- as.Date(datasub$Date, format="%d/%m/%Y")
datasub$Time <- strptime(datasub$Time, format="%H:%M:%S")
datasub[1:1440,"Time"] <- format(datasub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
datasub[1441:2880,"Time"] <- format(datasub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#displaying chart
plot (datasub$Time,datasub$Sub_metering_1,type="n",main="Energy sub-metering",xlab="",ylab="Energy sub metering")
legend("topright" , lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(datasub$Time,datasub$Sub_metering_1)
lines(datasub$Time,datasub$Sub_metering_2, col = "red")
lines(datasub$Time,datasub$Sub_metering_3, col = "blue")

#creating png
with(datasub, {
  png(filename = "plot3.png")
  plot (datasub$Time,datasub$Sub_metering_1,type="n",main="Energy sub-metering",xlab="",ylab="Energy sub metering")
  legend("topright" , lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  lines(datasub$Time,datasub$Sub_metering_1)
  lines(datasub$Time,datasub$Sub_metering_2, col = "red")
  lines(datasub$Time,datasub$Sub_metering_3, col = "blue")
  dev.off()
})
