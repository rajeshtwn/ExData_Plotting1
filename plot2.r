plot2 <- function() {
	data_file <- "../household_power_consumption.txt"
	if(file.exists(data_file)) {
		power_data <- read.table(data_file, sep=";", header=TRUE)

		# Select only data from dates 2007-02-01 and 2007-02-02
		new_data <- power_data[(power_data$Date %in% c('1/2/2007', '2/2/2007')),]
		new_data$Date <- as.Date(new_data$Date, format="%d/%m/%Y")
		new_data$Global_active_power <-as.numeric(as.character(new_data$Global_active_power))
		
		new_data <- transform(new_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
		
		plot(new_data$timestamp, new_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
		
		print("Saving plot...")
		dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
	}
	else {
		print("File doesn't exist...")
	}
}
