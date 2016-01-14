############################################################################################################
#'
#'
#'Code for plot1: Global Active Power vs. Frecuency
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

png("plot1.png" , width = 480, height = 480)
hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", yaxt = "n")
axis(2,seq(0,1200, by = 200))
dev.off()


