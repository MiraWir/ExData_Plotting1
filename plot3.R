# Load data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Filter for Feb 1 & 2, 2007
filtered_data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Open PNG device
png("plot3.png", width=480, height=480)

# Plot
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col="blue")

# Add legend
legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot
dev.off()
