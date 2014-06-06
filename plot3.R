# Reading and subsetting the data  
consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
consumption <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007",]
consumption <- consumption[complete.cases(consumption),]

# Plotting the lines of the three different sub meterings in the same image
png("plot3.png")
datetimes <- strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")
plot(datetimes, consumption$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetimes, consumption$Sub_metering_2, col="red")
lines(datetimes, consumption$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()