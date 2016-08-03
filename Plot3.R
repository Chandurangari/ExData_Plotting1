#Read household data
household<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F,na.strings = "?")

#Format date field
household$Date<-as.Date(household$Date,"%d/%m/%Y")

#Extract only graph data for first 2 day of Feb 2007
graphdata<-subset(household,Date >="2007-02-01" & Date <="2007-02-02")

graphdata$DateTime<-as.POSIXct(paste(graphdata$Date,graphdata$Time))
#Plot Graph Plot1.png


plot(graphdata$DateTime, graphdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(graphdata$DateTime, graphdata$Sub_metering_2, type="l", col="red")
lines(graphdata$DateTime, graphdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))



#Save Plot2.png
dev.copy(png,file="./4. Data exploratory/Plot3.png",height=480,width=480)
dev.off()
