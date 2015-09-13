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

# Produce plot 3 and save it to file
png(file="plot3.png", height=480, width=480, bg= "white")
myDateTime <- paste(mydata$Date,mydata$Time,sep = " ")
time <- strptime(myDateTime,format="%d/%m/%Y %H:%M:%S")

plot(time,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time,mydata$Sub_metering_2,col="red")
lines(time,mydata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.)

dev.off()
cat("plot3.png has been saved in ", getwd(),"\n")
