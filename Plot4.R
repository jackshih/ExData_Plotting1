#1. Get file
directory <- file.path(getwd(), "Repos", "ExData_Plotting1", "ExData_Plotting1")
path <- file.path(directory, "household_power_consumption.txt")

#2. read data
myData <- read.csv(file=path, header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
myData$myDate <- as.Date(myData$Date, "%d/%m/%Y")

#3. filter data
filteredData <- subset(myData, myDate >= "2007-02-01" & myDate <= "2007-02-02")

#4. Export to png
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filteredData$Global_active_power)
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)
globalReactivePower <- as.numeric(filteredData$Global_reactive_power)
voltage <- as.numeric(filteredData$Voltage)

png(file.path(directory, "Plot4.png"), width = 480)
par(mfrow = c(2, 2)) 
# plot 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# plot 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# plot 4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()