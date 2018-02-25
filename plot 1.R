setwd("C:\\Users\\Mervin\\EDA\\Week 1\\Project")

png('plot1.png')
completedata <- read.csv("household_power_consumption.txt", 
				 header=TRUE, sep=';', na.strings="?", 
                         nrows=2075259, stringsAsFactors=FALSE)
subdata <- subset(completedata, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

hist(subdata$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
