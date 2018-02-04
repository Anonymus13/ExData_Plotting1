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
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
