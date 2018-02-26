# plot3.R

# The following code creates a line graph of the Global active power vs. DateTime.

d <- read.csv("household_power_consumption.txt", na.strings = "?",
              sep = ";")
# get the two days of data on Feb. 1-2, 2007.
d <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

# convert to DateTime objects together the variables 'Date' and 'Time'
x <- strptime(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")
y <- d$Sub_metering_1

png("plot3.png")
plot(x,y, type="n", xlab = "", ylab = "Energy sub metering")
lines(x,y)
y <- d$Sub_metering_2
lines(x, y, col="red")
y <- d$Sub_metering_3
lines(x, y, col="blue")
symbol_names <- c(paste0(rep("Sub_metering_",3), 1:3))
legend(x="topright", symbol_names, col = c("black", "red", "blue"), lty = 1)
dev.off()
