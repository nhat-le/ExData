#setwd("C:/Users/lmn/Documents/Rprog/ExData1")

png("plot1.png")

#Read the data
alldata<-read.table("household_power_consumption.txt",sep = ";",nrows=70000,header=TRUE,na.strings="?")

#Extract the desired dates
alldata<- alldata[alldata[,1] %in% c("1/2/2007","2/2/2007"),]

#Plot the histrogram
hist(alldata$Global_active_power,col="orangered",xlab="Global Active Power (kilowatts)",main = "Global Active Power")

dev.off()