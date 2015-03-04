#read data
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, colClasses = c("character", "character", rep("numeric", 7)))

#store in 'dates' the dates converted to Date format
dates <- as.Date(data$Date, "%d/%m/%Y")

#filter data to get only 1/2/2007 and 2/2/2007
filtered <- data[(dates >= as.Date("1/2/2007", "%d/%m/%Y") & dates <= as.Date("2/2/2007", "%d/%m/%Y")),]

#set the png device
png(filename = "plot1.png", width=480, height=480)

#plot the histogram
hist(filtered$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close the png device
dev.off()
