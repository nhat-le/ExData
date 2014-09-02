#setwd("C:/Users/lmn/Documents/Rprog/ExData1")

png("plot3.png")

#Read the data
alldata<-read.table("household_power_consumption.txt",sep = ";",nrows=70000,header=TRUE,na.strings="?")

#Extract the desired dates
alldata<- alldata[alldata[,1] %in% c("1/2/2007","2/2/2007"),]

#Combine date and time and convert to the date-time format
datetimes <- paste(alldata[,1],alldata[,2])
datetimes <- strptime(datetimes,"%d/%m/%Y %H:%M:%S")

alldata<-cbind(alldata,datetimes)

#Plot the data: first produce an empty plot, then add the lines
plot(alldata$datetimes,alldata$Sub_metering_1,xlab="",ylab = "Energy sub metering", type = "n")
lines(alldata$datetimes,alldata$Sub_metering_1,col="black")
lines(alldata$datetimes,alldata$Sub_metering_2,col="red")
lines(alldata$datetimes,alldata$Sub_metering_3,col="blue")

#Add the legend
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()