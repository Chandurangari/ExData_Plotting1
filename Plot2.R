#Read household data
household<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F,na.strings = "?")

#Format date field
household$Date<-as.Date(household$Date,"%d/%m/%Y")

#Extract only graph data for first 2 day of Feb 2007
graphdata<-subset(household,Date >="2007-02-01" & Date <="2007-02-02")

graphdata$DateTime<-as.POSIXct(paste(graphdata$Date,graphdata$Time))
#Plot Graph Plot1.png


plot(graphdata$Global_active_power~graphdata$DateTime,xlab="", ylab = "Global Active Power (Kilowatts)")


#Save Plot2.png
dev.copy(png,file="./4. Data exploratory/Plot2.png",height=480,width=480)
dev.off()
