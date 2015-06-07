# open whole file
df <- "./data/household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset file and then destroy "big" object
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# normalizing data
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plotting
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# save file
dev.copy(png, file="./figure/plot2.png", height=480, width=480)
dev.off()