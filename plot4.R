#getting and cleaning data (same for all plots)
names <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
types <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
           "numeric", "numeric", "numeric")
data <-read.csv2("C:/Users/Jeff/Exploratory/exdata_data_household_power_consumption/household_power_consumption.txt",
                 na.strings = "?", dec = ".", skip = 66637, nrows = 2880, 
                 header = FALSE, col.names = names, colClasses = types)
dates <- paste(data$Date, data$Time, sep="_")
library(lubridate)
Date.Time <- dmy_hms(dates)
data2 <- cbind(Date.Time, data[,c(3:9)])

#Plot 4
png("Plot 4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar = c(2,4.1,1,1))
plot(data2$Date.Time, data2$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", cex.axis = .6, cex.lab =.8)
plot(data2$Date.Time, data2$Voltage, type = "l", xlab = "", ylab = "Voltage", 
     cex.axis = .6, cex.lab =.8)
plot(data2$Date.Time, data2$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy Sub metering", cex.axis = .6, cex.lab =.8)
lines(data2$Date.Time, data2$Sub_metering_2, col = "red")
lines(data2$Date.Time, data2$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1), col = c("Black", "Red", "Blue"), 
       legend = c("sub metering 1","sub metering 2","sub metering 3"), 
       cex = .6, xpd=NA)
plot(data2$Date.Time, data2$Global_reactive_power, type = "l", xlab = "", 
     ylab = "Global Reactive Power (kilowatts)", cex.axis = .6, cex.lab =.8)
dev.off()