#Reading data and extracting rows only for dates 1/2/2007 & 2/2/2007
dt <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
new_dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"), ]

#Viewing data
View(new_dt)

#Changing to Date & Time Class
new_dt$Date <- as.Date(new_dt$Date, format="%D")
new_dt$Time <- strptime(new_dt$Time, "%H:%M:%S")
format(new_dt$Time, "%H:%M:%S")

#plotting
png("./data/plot1.png", width=480, height=480)
hist(new_dt$Global_active_power, col = "red", xlab= "Global Active power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
