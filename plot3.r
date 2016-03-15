plot3 <- function() {
	data_file <- "../household_power_consumption.txt"
	if(file.exists(data_file)) {
		power_data <- read.table(data_file, sep=";", header=TRUE)

		# Select only data from dates 2007-02-01 and 2007-02-02
		new_data <- power_data[(power_data$Date %in% c('1/2/2007', '2/2/2007')),]
		new_data$Date <- as.Date(new_data$Date, format="%d/%m/%Y")
		new_data$Sub_metering_1 <- as.numeric(as.character(new_data$Sub_metering_1))
        new_data$Sub_metering_2 <- as.numeric(as.character(new_data$Sub_metering_2))
        new_data$Sub_metering_3 <- as.numeric(as.character(new_data$Sub_metering_3))
		
		new_data <- transform(new_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
		
		plot(new_data$timestamp, new_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
		lines(new_data$timestamp, new_data$Sub_metering_2, col="red")
        lines(new_data$timestamp, new_data$Sub_metering_3, col="blue")
		legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1.5,1.5), col=c("black","red","blue"))
		
		print("Saving plot...")
		dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
	}
	else {
		print("File doesn't exist...")
	}
}
