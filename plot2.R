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
plot(time,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Save to file
dev.copy(png, file="plot2.png", height=480, width=480, bg= "white")
dev.off()
cat("plot2.png has been saved in ", getwd(),"\n")
