##Reading data
setwd("N:/Explanatory_analysis")
data <- read.table("./household_power_consumption.txt" , header=T, sep=";", na.strings="?")
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
dates <- as.character(data1$Date)
times <- as.character(data1$Time)
data1$Date <- strptime(dates, "%d/%m/%Y")
data1$Time <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

##Plotting
par(mar=c(3,4.4,2,2))
with(data1, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering"))
with(data1, lines(Time, Sub_metering_1))
with(data1, lines(Time, Sub_metering_2, col="red"))
with(data1, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
