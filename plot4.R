##Reading data
#setwd("N:/Explanatory_analysis") #your working directory
colnames <- read.table("./household_power_consumption.txt", nrows=1, sep=";", header=F)
cnames <- as.vector(t(colnames))
##ids <- grep("1/2/2007", readLines("./household_power_consumption.txt"), fixed=T) #used to determine the range
##ids2 <- grep("3/2/2007", readLines("./household_power_consumption.txt"), fixed=T) # from 1/2 to 3/2/2007
ids <- 66638
ids2 <- 69518
numrows <- ids2[1] - ids[1]
data <- read.table("./household_power_consumption.txt", skip=ids[1]-1, nrows=numrows, col.names= cnames, sep=";",na.strings="?")
dates <- as.character(data$Date)
times <- as.character(data$Time)
data$Date <- strptime(dates, "%d/%m/%Y")
data$Time <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

##Plotting
par(mfrow=c(2,2), oma=c(1,0,0,0))
par(mar=c(3,4.4,2,2))
with(data1, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
par(mar=c(4,4.4,2,2))
with(data1, plot(Time, Voltage, type="l", ylab="Voltage", xlab="datetime"))
par(mar=c(3,4.4,2,2))
with(data1, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering"))
with(data1, lines(Time, Sub_metering_1))
with(data1, lines(Time, Sub_metering_2, col="red"))
with(data1, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(mar=c(4,4.4,2,2))
with(data1, plot(Time, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))
