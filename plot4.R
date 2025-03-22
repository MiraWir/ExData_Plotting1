# Load data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Filter for Feb 1 & 2, 2007
filtered_data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Open PNG device
png("plot4.png", width=480, height=480)

# Set up 2x2 layout
par(mfrow=c(2,2))

# Top-left: Global Active Power
plot(filtered_data$DateTime, filtered_data$Global_active_power, type="l", col="black",
     xlab="", ylab="Global Active Power")

# Top-right: Voltage
plot(filtered_data$DateTime, filtered_data$Voltage, type="l", col="black",
     xlab="datetime", ylab="Voltage")

# Bottom-left: Energy sub metering
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom-right: Global Reactive Power
plot(filtered_data$DateTime, filtered_data$Global_reactive_power, type="l", col="black",
     xlab="datetime", ylab="Global Reactive Power")

# Save plot
dev.off()
