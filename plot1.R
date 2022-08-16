#load data and subset
data <- read.csv("household_power_consumption.txt", sep=";")
data <- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]

#add time column
data$timemerge <- paste(data$Date, data$Time)
data$timemerge <- strptime(data$timemerge, "%d/%m/%Y %H:%M:%S")

#plot1
png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data$Global_active_power),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()