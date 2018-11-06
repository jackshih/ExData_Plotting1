#1. Get file
directory <- file.path(getwd(), "Repos", "ExData_Plotting1", "ExData_Plotting1")
path <- file.path(directory, "household_power_consumption.txt")

#2. read data
myData <- read.csv(file=path, header=TRUE, sep=";")
myData$myDate <- as.Date(myData$Date, "%d/%m/%Y")

#3. filter data
filteredData <- subset(myData, myDate >= "2007-02-01" & myDate <= "2007-02-02")
filteredData$gap <- as.double(filteredData$Global_active_power) / 500

#4. Export to png
png(file.path(directory, "Plot1.png"), width = 480)
hist(filteredData$gap, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()