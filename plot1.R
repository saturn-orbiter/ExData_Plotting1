# plot1.R
# The following code creates a histogram of the Global active power 
# variable.

# The following packages are assummed to be installed:
# 

d <- read.csv("household_power_consumption.txt", na.strings = "?",
              sep = ";")
# get the two days of data on Feb. 1-2, 2007.
d <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

# make a histogram of the "Global Active Power" variable with the following
# requirements:
# 1. title = Global Active Power, 2. xlab = Global Active Power (kilowatts)
# 3. red bars (bins), 4.

png("plot1.png") # required pixel size is the default
hist(d$Global_active_power, col="red", main = "Global Active Power", xlab = 
       "Global Active Power (kilowatts)")
dev.off() # close current device, and return to screen


