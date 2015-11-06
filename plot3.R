# Exploratory Data Analysis
# Course Project 1
# Plot 3 - plot of Sub_metering_n (n = 1,2,3)  

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

# Constructing a plot of Sub_meterings

## Opening PNG graphics device
png(file = "plot3.png", width = 480, height = 480)

## Preserving the current locale
myLocale <- Sys.getlocale("LC_ALL")

## Changing locale to English (for correct x-labels)
Sys.setlocale("LC_ALL", "English")

## Plotting
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
       lty = 1)

## Restoring locale
Sys.setlocale("LC_ALL", myLocale)

## Closing PNG graphics device
dev.off()
