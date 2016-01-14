############################################################################################################
#'
#'
#'Code for plot1: Datetime vs. Global Active Power (kilowatts)
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

Date_time <- paste (hpcD$Date, hpcD$Time)
Date_t <- strptime(Date_time, format='%d/%m/%Y %H:%M:%S')

png("plot2.png" , width = 480, height = 480)
plot(Date_t, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


