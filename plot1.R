# Read in data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date)

data2 <- subset(data, (data$Date == "2007-02-01") | (data$Date == "2007-02-02"))

#Create first plot
png("plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
