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
png(filename = "plot2.png", width=480, height=480)

#plot the time series
plot(times, filtered$Global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)")

#close the png device
dev.off()
