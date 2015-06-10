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

# plot 2
plot(data$datetime, data$Global_active_power, type='l', 
     ylab='Global Active Power (kilowatts)', xlab='')
png("plot2.png", width=480, height=480, units='px')
plot(data$datetime, data$Global_active_power, type='l', 
     ylab='Global Active Power (kilowatts)', xlab='')
dev.off()
