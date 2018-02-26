# plot4.R

# The following code creates various graphs of the following, 
#       row-wise in 2 rows and 2 columns:

#   1. Global Active Power vs datetime.
#   2. Voltage vs datetime.
#   3. Energy sub metering vs datetime.
#   4. Global Reactive Power vs datetime.

# read data selecting only the 2 days of interest: 1-2, Feb., 2007
d <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";")
d <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

# convert to DateTime objects together the variables 'Date' and 'Time'
x <- strptime(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")

# Set global plotting parameters
png("plot4.png")
par(mfrow = c(2,2)) # create 2x2 grid of plots

# Graph 1
y <- d$Global_active_power
plot(x,y, type="n", xlab = "", ylab = "Global Active Power")
lines(x,y)

# Graph 2
y <- d$Voltage
plot(x,y, type="n", xlab = "datetime", ylab = "Voltage")
lines(x,y)

# Graph 3

y <- d$Sub_metering_1
plot(x,y, type="n", xlab = "", ylab = "Energy sub metering")

lines(x,y) # plot sub metering 1
y <- d$Sub_metering_2
lines(x, y, col="red") # plot sub metering 2
y <- d$Sub_metering_3
lines(x, y, col="blue") # plot sub metering 3
# draw legend
symbol_names <- c(paste0(rep("Sub_metering_",3), 1:3))
legend(x="topright", symbol_names, col = c("black", "red", "blue"), lty = 1,
       bty = "n")

# Graph 4
y <- d$Global_reactive_power
plot(x,y, type="n", xlab = "datetime", ylab ="Global_reactive_power" )
lines(x,y)

dev.off()
