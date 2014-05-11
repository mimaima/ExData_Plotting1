# 05/10/2014
# Exploratory Data Analysis Course Project 1
# plot2

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

# create plot2.png
png("plot2.png", width=480, height= 480)
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
