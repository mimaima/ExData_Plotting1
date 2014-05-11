# 05/10/2014
# Exploratory Data Analysis Course Project 1
# plot4

# if you do not have sqldf package, you can install sqldf package by running the following command: install.packages("sqldf")
require(sqldf)

# clean all objects in R memory
rm(list=ls())

# read 1/2/2007 and 2/2/2007 data from household_power_consumption.txt in the same directory
file <- "./household_power_consumption.txt"
data <- read.csv.sql(file, sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

# Change Date variable from String to Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Create a new column DateTime from Date and Time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# create plot4.png
png("plot4.png", width = 480, height = 480)
# define 4 curves in one plot and add plots in the order of (1,1), (1,2), (2,1), (2,2)
par(mfrow=c(2,2))
# 1st plot
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
# 2nd plot
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd plot
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))
# 4th plot
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
