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

# Produce plot 1 and save to file
png(file="plot1.png", height=480, width=480, bg= "white")
hist(mydata$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
cat("plot1.png has been saved in ", getwd(),"\n")
