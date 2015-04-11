# reads in the data
data <- read.table("/Users/beng/datasciencecoursera/household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

# obtains only data from 2007-02-01 and 2007-02-02
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# converts Date and Time variables to Date/Time classes for manipulation
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

# starts graphic design driver
quartz()

# plots histogram of Global Active Power
hist(as.numeric(data$Global_active_power), 
	 main="Global Active Power",
	 xlab="Global Active Power (kilowatts)",
	 col="Red")

# copies the results to a PNG file
# NOTE: background is transparent as is the case in the instructor's sample image
# (right click on image and save to file to observe the background colour)
dev.copy(png, "plot1.png", width=480, height=480)

#switches off graphic design driver
dev.off()