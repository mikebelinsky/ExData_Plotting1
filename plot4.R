library(plyr)

setwd('C:/Users/Mike/Dropbox (Instiglio)/Rwork/COURSERA/ExData_Plotting1/')

# read in data 
file = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(file, destfile='household_power_consumption.zip')
unzip('household_power_consumption.zip')
setwd("C:/Users/Mike/Dropbox (Instiglio)/Rwork/DATA")
data.readin = read.csv('household_power_consumption.txt', sep=';')

# format data 

data = data.readin

temp = paste0(as.character(data[,1]), ' ', as.character(data[,2]))
data$datetime = strptime(temp, "%d/%m/%Y %H:%M:%S")

data = data[data$datetime>='2007-02-01 00:00:00 EST' & data$datetime<='2007-02-03 00:00:00 EST',]

data[,3] = as.double(data[,3])
data[,4] = as.double(data[,4])
data[,5] = as.double(data[,5])
data[,6] = as.double(data[,6])
data[,7] = as.double(data[,7])
data[,8] = as.double(data[,8])
data[,9] = as.double(data[,9])


# plot 4

par(mfrow=c(2,2))

hist(data$Global_active_power, col='red', 
     xlab='Global Active Power (kilowatts)', ylab='Frequency', 
     main='Global Active Power')

plot(data$datetime, data$Global_active_power, type='l', 
     ylab='Global Active Power (kilowatts)', xlab='')

plot(data$datetime, data$Sub_metering_1, type='l', col='black', 
     ylab='Energy sub metering', xlab='')
lines(data$datetime, data$Sub_metering_2, type='l', col='red')
lines(data$datetime, data$Sub_metering_3, type='l', col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1, lwd=c(2.5,2.5,2.5), col=c("black","blue","red"), cex=.75)

plot(data$datetime, data$Global_reactive_power, type='l', ylab='Global_reactive_power',
     xlab='')


png("plot4.png", width=480, height=480, units='px')
par(mfrow=c(2,2))

hist(data$Global_active_power, col='red', 
     xlab='Global Active Power (kilowatts)', ylab='Frequency', 
     main='Global Active Power')

plot(data$datetime, data$Global_active_power, type='l', 
     ylab='Global Active Power (kilowatts)', xlab='')

plot(data$datetime, data$Sub_metering_1, type='l', col='black', 
     ylab='Energy sub metering', xlab='')
lines(data$datetime, data$Sub_metering_2, type='l', col='red')
lines(data$datetime, data$Sub_metering_3, type='l', col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1, lwd=c(2.5,2.5,2.5), col=c("black","blue","red"), cex=.75)

plot(data$datetime, data$Global_reactive_power, type='l', ylab='Global_reactive_power',
     xlab='')

dev.off()


