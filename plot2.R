# plot2.R
# The following code creates a line graph of the 
# Global active power vs datetime.


# The following packages are assummed to be installed:
# 

d <- read.csv("household_power_consumption.txt", na.strings = "?",
              sep = ";")
# get the two days of data on Feb. 1-2, 2007.
d <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

# convert to DateTime objects together the variables 'Date' and 'Time'
x <- strptime(paste(d$Date, d$Time), format = "%d/%m/%Y %H:%M:%S")
y <- d$Global_active_power

png("plot2.png")
plot(x,y, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(x,y)
dev.off()
