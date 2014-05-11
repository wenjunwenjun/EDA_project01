household_power_consumption <- read.table("~/EDA_data/household_power_consumption.txt", sep=";", quote="\"",header=TRUE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

Date_time <-paste(household_power_consumption$Date, household_power_consumption$Time, sep=" ")

Date_time <- strptime(Date_time, "%Y-%m-%d %H:%M:%S")

household_power_consumption_comb <- cbind(household_power_consumption,Date_time)

household_power_consumption_2day <- subset(household_power_consumption_comb, Date=="2007-02-01" | Date=="2007-02-02")

household_power_consumption_2day$Sub_metering_1 <- (as.numeric(as.character(household_power_consumption_2day$Sub_metering_1)))
household_power_consumption_2day$Sub_metering_2 <- (as.numeric(as.character(household_power_consumption_2day$Sub_metering_2)))
par(mfrow=c(1,1))

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(Sub_metering_1 ~ Date_time, data= household_power_consumption_2day,xlab="",
     ylab="Energy Sub Metering",type="n")

lines(Sub_metering_1~ Date_time, data= household_power_consumption_2day,lwd=1)

lines(Sub_metering_2~ Date_time, data= household_power_consumption_2day,lwd=1,col="red")

lines(Sub_metering_3~ Date_time, data= household_power_consumption_2day,lwd=1,col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(0.1,0.1,0.1) ,col=c("black","red","blue"))

dev.off()


