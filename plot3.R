# reads in the data
data <- read.table("/Users/beng/datasciencecoursera/household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

# obtains only data from 2007-02-01 and 2007-02-02
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# converts Date and Time variables to Date/Time classes for manipulation
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

# starts graphic design driver
quartz()

# plots line graphs of each Energy sub metering against time
plot(data$DateTime, data$Sub_metering_1,
	 xlab="",
	 ylab="Energy sub metering",
	 type="l")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

# adds in legend
legend("topright",
	   "(x,y)",
	   col=c("black","red","blue"),
	   legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "), 
	   lty=1)

# copies the results to a PNG file
# NOTE: background is transparent as is the case in the instructor's sample image
# (right click on image and save to file to observe the background colour)
dev.copy(png, "plot3.png", width=480, height=480)

#switches off graphic design driver
dev.off()