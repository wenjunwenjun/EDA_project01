household_power_consumption <- read.table("~/EDA_data/household_power_consumption.txt", sep=";", quote="\"",header=TRUE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

Date_time <-paste(household_power_consumption$Date, household_power_consumption$Time, sep=" ")

Date_time <- strptime(Date_time, "%Y-%m-%d %H:%M:%S")

household_power_consumption_comb <- cbind(household_power_consumption,Date_time)

household_power_consumption_2day <- subset(household_power_consumption_comb, Date=="2007-02-01" | Date=="2007-02-02")
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
##plot2
household_power_consumption_2day$Global_active_power<-as.numeric(as.character(household_power_consumption_2day$Global_active_power))

plot(Global_active_power~ Date_time, data= household_power_consumption_2day,pch=20,cex=0.1,xlab="",
     ylab="Global Active Power (kilowatts)", type="l",lwd=1)
###for Votage plot
household_power_consumption_2day$Voltage <- as.numeric(as.character(household_power_consumption_2day$Voltage))
plot(Voltage ~ Date_time,data=household_power_consumption_2day, xlab="datatime",ylab="Voltage",type="l")
###for plot3
household_power_consumption_2day$Sub_metering_1 <- (as.numeric(as.character(household_power_consumption_2day$Sub_metering_1)))
household_power_consumption_2day$Sub_metering_2 <- (as.numeric(as.character(household_power_consumption_2day$Sub_metering_2)))
plot(Sub_metering_1 ~ Date_time, data= household_power_consumption_2day,xlab="",
     ylab="Energy Sub Metering",type="n")

lines(Sub_metering_1~ Date_time, data= household_power_consumption_2day,lwd=1)

lines(Sub_metering_2~ Date_time, data= household_power_consumption_2day,lwd=1,col="red")

lines(Sub_metering_3~ Date_time, data= household_power_consumption_2day,lwd=1,col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(0.1,0.1,0.1) ,col=c("black","red","blue"))

###for reactive plot
household_power_consumption_2day$Global_reactive_power<-as.numeric(as.character(household_power_consumption_2day$Global_reactive_power))

plot(Global_reactive_power~ Date_time, data=household_power_consumption_2day, xlab="datatime",type="l" )

dev.off()
