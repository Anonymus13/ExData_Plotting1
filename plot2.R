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
with(data1, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab= NULL))