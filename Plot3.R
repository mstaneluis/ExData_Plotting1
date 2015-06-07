# open whole file
df <- "./data/household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset file and then destroy "big" object
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# normalizing data
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# plotting
plot(dateTime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, pt.cex = 1, lty=1, lwd=1.5, col=c("black", "red", "blue"))
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")

# save file
dev.copy(png, file="./figure/plot3.png", height=480, width=480)
dev.off()