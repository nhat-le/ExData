#setwd("C:/Users/lmn/Documents/Rprog/ExData1")

png("plot2.png")

#Read the data
alldata<-read.table("household_power_consumption.txt",sep = ";",nrows=70000,header=TRUE,na.strings="?")

#Extract the desired dates
alldata<- alldata[alldata[,1] %in% c("1/2/2007","2/2/2007"),]

#Combine date and time and convert to the date-time format
datetimes <- paste(alldata[,1],alldata[,2])
datetimes <- strptime(datetimes,"%d/%m/%Y %H:%M:%S")

alldata<-cbind(alldata,datetimes)

#Plot the data
plot(alldata$datetimes,alldata$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()
