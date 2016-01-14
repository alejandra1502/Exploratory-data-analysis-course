############################################################################################################
#'
#'
#'Code for plot3: Datetime vs. Entering sub metering
#'
#'Author: Alejandra Alvarez 
#'
#'
############################################################################################################
setwd('Working directory')

hpc <- read.table('household_power_consumption.txt', sep = ";", header=TRUE)

hpcD1 <- subset(hpc, Date == '1/2/2007')
hpcD2 <- subset(hpc, Date == '2/2/2007')

hpcD <- NULL
hpcD <- rbind(hpcD, hpcD1, hpcD2)

Sub_metering_1 <- as.numeric(as.character(hpcD$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(hpcD$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(hpcD$Sub_metering_3))

Date_time <- paste (hpcD$Date, hpcD$Time)
Date_t <- strptime(Date_time, format='%d/%m/%Y %H:%M:%S')

png("plot3.png" , width = 480, height = 480)
plot(Date_t, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Date_t, Sub_metering_1, col = "black")
lines(Date_t, Sub_metering_2, col = "red")
lines(Date_t, Sub_metering_3, col = "blue")

legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = "_", cex = 1.0) 

dev.off()

