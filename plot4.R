#Read in data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date)

data2 <- subset(data, (data$Date == "2007-02-01") | (data$Date == "2007-02-02"))

#Create fourth plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#top left
plot(data2$Global_active_power, xaxt="n", type="l", ann=FALSE)
axis(1, at=c(1,1441,2880), labels=c("Thu", "Fri", "Sat"))
title(ylab="Global Active Power")

#top right
plot(data2$Voltage, xaxt="n", ylab="Voltage", type="l", xlab="datetime")

#bottom left
plot(data2$Sub_metering_1, xaxt="n", type="l", ann=FALSE)
points(data2$Sub_metering_2, type="l", col="red")
points(data2$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col=c("black", "red", "blue"), bty="n")
axis(1, at=c(1,1441,2880), labels=c("Thu", "Fri", "Sat"))
title(ylab="Energy sub metering")

#bottom right
plot(data2$Global_reactive_power, xaxt="n", ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()
