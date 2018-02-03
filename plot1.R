##Reading data
#setwd("N:/Explanatory_analysis") #set your working directory (where you unzipped the data)
data <- read.table("./household_power_consumption.txt" , header=T, sep=";", na.strings="?")
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
dates <- as.character(data1$Date)
times <- as.character(data1$Time)
data1$Date <- strptime(dates, "%d/%m/%Y")
data1$Time <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

##Plotting
hist(data1$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
