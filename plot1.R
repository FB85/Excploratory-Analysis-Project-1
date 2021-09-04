
## getting data
data <- read.csv("household_power_consumption.txt", sep = ";")
datasub <- subset(data,data$Date =="1/2/2007" | data$Date =="2/2/2007")
datasub <- transform(datasub, Global_active_power = as.numeric(Global_active_power))

#displaying chart
hist(datasub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#creating png
with(datasub, {
  png(filename = "plot1.png")
  hist(datasub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
})