# Exploratory Data Analysis
# Course Project 1
# Plot 1 - histogram of Global active power 

# Loading the Household Power Consumption data
hpcData <- read.csv("./data/household_power_consumption.txt",
                    sep = ";",
                    na.strings = "?")

# Removeing all NAs
hpcData <- na.omit(hpcData)

# Selecting data from the dates 2007-02-01 and 2007-02-02
hpcData <- hpcData[(hpcData$Date == "1/2/2007" | 
                    hpcData$Date == "2/2/2007"), ]

# Opening PNG graphics device
png(file = "plot1.png", width = 480, height = 480)

# Plotting histogram of Global Active Power 
hist(hpcData$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# Closing PNG graphics device
dev.off()
