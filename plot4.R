## Coursera : Exploratory Data Analysis
## @Author: mbelletato
## Course Project 1
## plot4.r

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

png(file = "plot4.png")

par(mfrow=c(2, 2))

plot(Data$DateTime , Data$Global_active_power, xlab="", 
     ylab="Global Active Power", type="l")

plot(Data$DateTime , Data$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(Data$DateTime, Data$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
points(Data$DateTime, Data$Sub_metering_1, col="black", type="l")
points(Data$DateTime, Data$Sub_metering_2, col="red", type="l")
points(Data$DateTime, Data$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(Data$DateTime , Data$Global_reactive_power, xlab="datetime", type="l")

dev.off()