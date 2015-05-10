#Reading data and extracting rows only for dates 1/2/2007 & 2/2/2007
dt <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
new_dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"), ]

#Viewing data
View(new_dt)

#Changing class & combing data and time variable into new_datetime
new_datetime <- strptime(paste(new_dt$Date, new_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plotting
png("./data/plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(new_datetime, new_dt$Global_active_power, type="l", xlab= "", ylab="Global Active power (kilowatts)", main=" ")
plot(new_datetime, new_dt$Voltage, type="l", xlab= "datetime", ylab="Voltage", main=" ")
plot(new_datetime, new_dt$Sub_metering_1 , type="l", xlab= "", ylab="Energy sub metering", main=" ")
lines(new_datetime, new_dt$Sub_metering_2 , col="red")
lines(new_datetime, new_dt$Sub_metering_3 , col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
plot(new_datetime, new_dt$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power", main=" ")
dev.off()