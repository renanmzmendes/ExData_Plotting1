# Reading and subsetting the data  
consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
consumption <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007",]

# Ploting the histogram and saving it to a PNG file
png()
with(consumption, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()