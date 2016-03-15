plot1 <- function() {
	data_file <- "../household_power_consumption.txt"
	if(file.exists(data_file)) {
		power_data <- read.table(data_file, sep=";", header=TRUE)

		# Select only data from dates 2007-02-01 and 2007-02-02
		new_data <- power_data[(power_data$Date %in% c('1/2/2007', '2/2/2007')),]
		hist(as.numeric(as.character(new_data$Global_active_power)), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
		
		print("Saving plot...")
		dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
	}
	else {
		print("File doesn't exist...")
	}
}	



