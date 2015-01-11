# set the working directory to match that of this script
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source('load-data.R')

png(filename='plot4.png')

par(mfrow=c(2,2))

# top left
plot(sub$DateTime, sub$Global_active_power, ylab='Global Active Power', xlab='', type='l')

# top right
plot(sub$DateTime, sub$Voltage, xlab='datetime', ylab='Voltage', type='l')

# bottom left
plot(sub$DateTime, sub$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(sub$DateTime, sub$Sub_metering_2, col='red')
lines(sub$DateTime, sub$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# bottom right
plot(sub$DateTime, sub$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')

dev.off()
