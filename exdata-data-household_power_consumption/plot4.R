############################################################################################################
#'
#'
#'Code for plot4: Multiple plots
#'
#'Author: Alejandra Alvarez 
#'
#'
#############################################################################################################
setwd('Working directory')

hpc <- read.table('household_power_consumption.txt', sep = ";", header=TRUE)

hpcD1 <- subset(hpc, Date == '1/2/2007')
hpcD2 <- subset(hpc, Date == '2/2/2007')

hpcD <- NULL
hpcD <- rbind(hpcD, hpcD1, hpcD2)

Global_active_power <- as.numeric(as.character(hpcD$Global_active_power))
Voltage <- as.numeric(as.character(hpcD$Voltage))
Sub_metering_1 <- as.numeric(as.character(hpcD$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(hpcD$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(hpcD$Sub_metering_3))

Date_time <- paste (hpcD$Date, hpcD$Time)
Date_t <- strptime(Date_time, format='%d/%m/%Y %H:%M:%S')

png("plot4.png" , width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,3,1), oma = c(0,0,2,1))   

plot(Date_t, as.numeric(as.character(hpcD$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")
plot(Date_t, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(Date_t, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
lines(Date_t, Sub_metering_1, col = "black")
lines(Date_t, Sub_metering_2, col = "red")
lines(Date_t, Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = "_", cex = 0.9) 
plot(Date_t, as.numeric(as.character(hpcD$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
