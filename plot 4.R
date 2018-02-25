setwd("C:\\Users\\Mervin\\EDA\\Week 1\\Project")

png('plot4.png')
completedata <- read.csv("household_power_consumption.txt", 
				 header=TRUE, sep=';', na.strings="?", 
                         nrows=2075259, stringsAsFactors=FALSE)
subdata <- subset(completedata, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(date_time)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
dev.off()
