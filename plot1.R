# Load data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date column to Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter for Feb 1 & 2, 2007
filtered_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Open PNG device
png("plot1.png", width=480, height=480)

# Create histogram
hist(filtered_data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Save plot
dev.off()
