# 05/10/2014
# Course Project 1 related to the course "Exploratory Data Analysis" of Coursera.
# plot3

rm(list=ls())
#reading data into R (you need to put the data in a sub-directory named on "Explor"):
data<- read.table("./household_power_consumption.txt", sep=";",nrows= 2075259, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
subdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Creating the plot3:
png("plot3.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()