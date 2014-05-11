household_power_consumption <- read.table("~/EDA_data/household_power_consumption.txt", sep=";", quote="\"",header=TRUE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

Date_time <-paste(household_power_consumption$Date, household_power_consumption$Time, sep=" ")

Date_time <- strptime(Date_time, "%Y-%m-%d %H:%M:%S")

household_power_consumption_comb <- cbind(household_power_consumption,Date_time)

household_power_consumption_2day <- subset(household_power_consumption_comb, Date=="2007-02-01" | Date=="2007-02-02")

household_power_consumption_2day$Global_active_power<-as.numeric(as.character(household_power_consumption_2day$Global_active_power))
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(household_power_consumption_2day$Global_active_power,breaks=20,col="red",xlab="Global Active Power (kilowatts)"
     , main="Global Active Power",ylim=c(0,1200))

dev.off()



