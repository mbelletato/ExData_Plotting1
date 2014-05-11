## Coursera : Exploratory Data Analysis
## @Author: mbelletato
## Course Project 1
## plot1.r

Data <- read.table(file = "household_power_consumption.txt", 
                   header=T, sep=";", na.strings="?", skip=66636, 
                   nrows=2880, 
                   col.names=c("Date", "Time", "Global_active_power", 
                               "Global_reactive_power", "Voltage", 
                               "Global_intensity", "Sub_metering_1", 
                               "Sub_metering_2", "Sub_metering_3")
                   )

Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
DateTime <- strptime(paste(Data$Date, Data$Time), "%Y-%m-%d %H:%M:%S")
Data <- cbind(Data, DateTime)

png(file = "plot1.png")

hist(Data$Global_active_power, xlab="Global Active Power (kilowatts)", 
     col="red", main="Global Active Power")

dev.off()
