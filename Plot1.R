# open whole file
df <- "./data/household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset file and then destroy "big" object
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# normalizing data
globalActivePower <- as.numeric(subSetData$Global_active_power)

# plotting
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# save file
dev.copy(png, file="./figure/plot1.png", height=480, width=480)
dev.off()