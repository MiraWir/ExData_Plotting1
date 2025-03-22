# Load data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Filter for Feb 1 & 2, 2007
filtered_data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Open PNG device
png("plot2.png", width=480, height=480)

# Create line plot
plot(filtered_data$DateTime, filtered_data$Global_active_power, type="l", col="black",
     xlab="", ylab="Global Active Power (kilowatts)", main="")

# Save plot
dev.off()
