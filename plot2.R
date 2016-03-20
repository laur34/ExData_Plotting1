#Read in data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date)

data2 <- subset(data, (data$Date == "2007-02-01") | (data$Date == "2007-02-02"))

#Create second plot
png("plot2.png", width=480, height=480)
par(mfrow=c(1,1))
plot(data2$Global_active_power, xaxt="n", ylab="Global Active Power (kilowatts)", type="l", ann=FALSE)
axis(1, at=c(1,1441,2880), labels=c("Thu", "Fri", "Sat"))
title(ylab="Global Active Power (kilowatts)")
dev.off()
