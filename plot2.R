#The file is located in the data folder
dataFile <- "data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#I only the data i need (February 2007)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
#Creates the PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#returns the number and name of the new active device (after the specified device has been shut down)
dev.off()
#Important note: You will see that in the x Axis the day names are in spanish due to my machine lang