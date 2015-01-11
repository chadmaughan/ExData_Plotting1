# set the working directory to match that of this script
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source('load-data.R')

png(filename='plot3.png')

plot(sub$DateTime, sub$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(sub$DateTime, sub$Sub_metering_2, col='red')
lines(sub$DateTime, sub$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

dev.off()
