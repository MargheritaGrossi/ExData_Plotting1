# Load dplyr library
library(dplyr)

# Read datafile
data <- read.csv("household_power_consumption.txt", header = T, sep =";",na.strings="?")

# Subset the data
date <- as.Date(data$Date,format='%d/%m/%Y')
year <- as.numeric(format(date,"%Y"))
month <- as.numeric(format(date,"%m"))
day<- as.numeric(format(date,"%d"))
mydata <- filter(data, year == 2007 & month == 2 & day < 3 )
rm(data)

# Produce plot 2
myDateTime <- paste(mydata$Date,mydata$Time,sep = " ")
time <- strptime(myDateTime,format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))

plot(time,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(time,mydata$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(time,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time,mydata$Sub_metering_2,col="red")
lines(time,mydata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.,bty="n")

plot(time,mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")


# Save to file
dev.copy(png, file="plot4.png", height=480, width=480, bg= "white")
dev.off()
cat("plot4.png has been saved in ", getwd(),"\n")
