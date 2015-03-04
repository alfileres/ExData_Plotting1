#read data
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, colClasses = c("character", "character", rep("numeric", 7)))

#store in 'dates' the dates converted to Date format
dates <- as.Date(data$Date, "%d/%m/%Y")

#filter data to get only 1/2/2007 and 2/2/2007
filtered <- data[(dates >= as.Date("1/2/2007", "%d/%m/%Y") & dates <= as.Date("2/2/2007", "%d/%m/%Y")),]

#time string as the concatenation of the Date and Time characters
timeString <- paste(filtered$Date, filtered$Time)
times <- strptime(timeString, "%d/%m/%Y %H:%M:%S")

#set the png device
png(filename = "plot3.png", width=480, height=480)

#plot the time series
plot(times, filtered$Sub_metering_1, "n", xlab="", ylab="Energy sub metering")
points(times, filtered$Sub_metering_1, "l", col="black")
points(times, filtered$Sub_metering_2, "l", col="red")
points(times, filtered$Sub_metering_3, "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)

#close the png device
dev.off()
