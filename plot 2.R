setwd("C:\\Users\\Mervin\\EDA\\Week 1\\Project")

png('plot2.png')
completedata <- read.csv("household_power_consumption.txt", 
				 header=TRUE, sep=';', na.strings="?", 
                         nrows=2075259, stringsAsFactors=FALSE)
subdata <- subset(completedata, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(date_time)

with(subdata, {
     plot(Global_active_power~Datetime, type="l", 
	    ylab="Global Active Power (kilowatts)", xlab="")
  })
dev.off()
