#getting and cleaning data
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

#Plot 1
png("Plot 1.png", width = 480, height = 480)
hist(data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()