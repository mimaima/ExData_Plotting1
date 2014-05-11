# 05/10/2014
# Course Project 1 related to the course "Exploratory Data Analysis" of Coursera.
# plot1

rm(list=ls())
#reading data into R (you need to put the data in a sub-directory named on "Explor"):
data<- read.table("./household_power_consumption.txt", sep=";",nrows= 2075259, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
subdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# creating plot1
png("plot1.png", width=480, height= 480)
hist(subdata$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()