# plot4.R

# The following code creates various of the following row-wise in 2 rows and 2 columns:
#   1. Global Active Power vs datetime.
#   2. Voltage vs datetime.
#   3. Energy sub metering vs datetime.
#   4. Global Reactive Power vs datetime.

d <- read.csv("household_power_consumption.txt", na.strings = "?",
              sep = ";")
# get the two days of data on Feb. 1-2, 2007.
d <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

# convert to DateTime objects together the variables 'Date' and 'Time'
x <- strptime(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")

# Set plotting parameters
par(mfrow = c(2,2)) # create 2x2 grid of plots
png("plot4.png")

# Graph 1
hist(d$Global_active_power, col="red", main = "Global Active Power", xlab = 
       "Global Active Power (kilowatts)")

# Graph 2
y <- d$Voltage
plot(x,y, type="n", xlab = "datetime", ylab = "Voltage")
lines(x,y)

# Graph 3
plot(x,y, type="n", xlab = "", ylab = "Energy sub metering")
y <- d$Sub_metering_1
lines(x,y)
y <- d$Sub_metering_2
lines(x, y, col="red")
y <- d$Sub_metering_3
lines(x, y, col="blue")
symbol_names <- c(paste0(rep("Sub_metering_",3), 1:3))
legend(x="topright", symbol_names, col = c("black", "red", "blue"), lty = 1)

# Graph 4
y <- d$Global_reactive_power
plot(x,y, type="n", xlab = "datetime", ylab = "Voltage")
lines(x,y)

dev.off()
