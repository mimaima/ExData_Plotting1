# 05/10/2014
# Exploratory Data Analysis Course Project 1
# plot1

# if you do not have sqldf package, you can install sqldf package by running the following command: install.packages("sqldf")
require(sqldf)

# clean all objects in R memory
rm(list=ls())

# read 1/2/2007 and 2/2/2007 data from household_power_consumption.txt in the same directory
file <- "./household_power_consumption.txt"
data <- read.csv.sql(file, sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

# create plot1.png
png("plot1.png", width=480, height= 480)
hist(data$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
