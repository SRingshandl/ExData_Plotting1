#load data and subset
data <- read.csv("household_power_consumption.txt", sep=";")
data <- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]

#add time column
data$timemerge <- paste(data$Date, data$Time)
data$timemerge <- strptime(data$timemerge, "%d/%m/%Y %H:%M:%S")

#plot2
Sys.setlocale("LC_TIME", "English") #necessary if english is not default language. For Windows only
png("plot2.png", width = 480, height = 480, units = "px")
plot(data$timemerge, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()