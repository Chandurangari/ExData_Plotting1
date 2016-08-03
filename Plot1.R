#Read household data
household<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F,na.strings = "?")

#Format date field
household$Date<-as.Date(household$Date,"%d/%m/%Y")

#Extract only graph data for first 2 day of Feb 2007
graphdata<-subset(household,Date >="2007-02-01" & Date <="2007-02-02")

#Plot Graph Plot1.png

hist(graphdata$Global_active_power,main="Global Active Power",xlab = "Global Active Power (Kilowatts)",col="Red")

#Save Plot1.png
dev.copy(png,file="./4. Data exploratory/Plot1.png",height=480,width=480)
dev.off()
