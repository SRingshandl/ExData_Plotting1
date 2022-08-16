#load data and subset
data <- read.csv("household_power_consumption.txt", sep=";")
data <- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]

#add time column
data$timemerge <- paste(data$Date, data$Time)
data$timemerge <- strptime(data$timemerge, "%d/%m/%Y %H:%M:%S")

#plot4
Sys.setlocale("LC_TIME", "English") #necessary if english is not default language. For Windows only
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(data$timemerge, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(data$timemerge, data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(data$timemerge, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
points(data$timemerge, data$Sub_metering_2,
       col = "red",
       type = "l")
points(data$timemerge, data$Sub_metering_3,
       col = "blue",
       type = "l")
legend("topright",
       lty = 1,
       bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$timemerge, data$Global_reactive_power,
     type = "l",
     xlab = "",
     ylab = "Global_reactive_power")
dev.off()
