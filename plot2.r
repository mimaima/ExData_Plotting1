# 05/10/2014
# Course Project 1 related to the course "Exploratory Data Analysis" of Coursera.
# plot2

rm(list=ls())
#reading data into R (you need to put the data in a sub-directory named on "Explor"):
data<- read.table("./household_power_consumption.txt", sep=";",nrows= 2075259, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
subdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Creating the plot2:
png("plot2.png", width=480, height= 480)
plot(subdata$DateTime, subdata$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()