#getting data
data <- read.csv("household_power_consumption.txt", sep = ";")
datasub <- subset(data,data$Date =="1/2/2007" | data$Date =="2/2/2007")

#preparing data
datasub$Date <- as.Date(datasub$Date, format="%d/%m/%Y")
datasub$Time <- strptime(datasub$Time, format="%H:%M:%S")
datasub[1:1440,"Time"] <- format(datasub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
datasub[1441:2880,"Time"] <- format(datasub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#displaying chart
plot(datasub$Time,as.numeric(as.character(datasub$Global_active_power)),type="l",main="Global Active Power Vs Time",xlab="",ylab="Global Active Power (kilowatts)")

#creating png
with(datasub, {
  png(filename = "plot2.png")
  plot(datasub$Time,as.numeric(as.character(datasub$Global_active_power)),type="l",main="Global Active Power Vs Time",xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
})
