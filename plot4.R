# Exploratory Data Analysis
# Course Project 1
# Plot 4 - combining 4 plots together into 2x2 grid

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

# Opening PNG graphics device
png(file = "plot4.png", width = 480, height = 480)

# Configuring graphic grid
par(mfcol=c(2,2), mar = c(6, 4, 2, 2))

## Preserving the current locale
myLocale <- Sys.getlocale("LC_ALL")

## Changing locale to English (for correct x-labels)
Sys.setlocale("LC_ALL", "English")

## Constructing a plot of Global Active Power 
plot(hpcData$DateTime,
     hpcData$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l")

## Constructing a plot of Sub_meterings
plot(hpcData$DateTime,
     hpcData$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     col = "black",
     type = "l")
lines(hpcData$DateTime,
      hpcData$Sub_metering_2,
      col = "red")
lines(hpcData$DateTime,
      hpcData$Sub_metering_3,
      col = "blue")

## Making the legend
legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       bty = "n",
       lty = 1)

## Constructing a plot of Voltage
plot(hpcData$DateTime,
     hpcData$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

## Constructing a plot of Global Reactive Power
plot(hpcData$DateTime,
     hpcData$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "s")

## Restoring locale
Sys.setlocale("LC_ALL", myLocale)

## Closing PNG graphics device
dev.off()
