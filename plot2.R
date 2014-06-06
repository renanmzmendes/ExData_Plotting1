# Reading and subsetting the data  
consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
consumption <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007",]
consumption <- consumption[complete.cases(consumption),]

# Plotting to PNG image
# X-axis is created by the concatenation of both date and time
# and their transformation to a POSIX object
png("plot2.png")
plot(strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC"), consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()