#1. Get file
directory <- file.path(getwd(), "Repos", "ExData_Plotting1", "ExData_Plotting1")
path <- file.path(directory, "household_power_consumption.txt")

#2. read data
myData <- read.csv(file=path, header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
myData$myDate <- as.Date(myData$Date, "%d/%m/%Y")

#3. filter data
filteredData <- subset(myData, myDate >= "2007-02-01" & myDate <= "2007-02-02")

#4. Export to png
globalActivePower <- as.numeric(filteredData$Global_active_power)
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(file.path(directory, "Plot2.png"), width = 480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()