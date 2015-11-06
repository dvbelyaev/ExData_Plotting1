# Exploratory Data Analysis
# Course Project 1
# Plot 2 - plot of Global active power 

# Loading the Household Power Consumption data
hpcData <- read.csv("./data/household_power_consumption.txt",
                    sep = ";",
                    na.strings = "?")

# Removeing all NAs
hpcData <- na.omit(hpcData)

# Selecting data from the dates 2007-02-01 and 2007-02-02
hpcData <- hpcData[(hpcData$Date == "1/2/2007" | 
                    hpcData$Date == "2/2/2007"), ]

# Combining Date and Time into one DateTime variable
hpcData$DateTime <- as.POSIXct(
                    paste(as.Date(hpcData$Date, format = "%d/%m/%Y"), 
                          hpcData$Time))

# Constructing a plot of Global Active Power 

## Opening PNG graphics device
png(file = "plot2.png", width = 480, height = 480)

## Preserving the current locale
myLocale <- Sys.getlocale("LC_ALL")

## Changing locale to English (for correct x-labels)
Sys.setlocale("LC_ALL", "English")

## Plotting
plot(hpcData$DateTime,
     hpcData$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

## Restoring locale
Sys.setlocale("LC_ALL", myLocale)

## Closing PNG graphics device
dev.off()
