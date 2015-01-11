# set the working directory to match that of this script
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source('load-data.R')

png(filename='plot2.png')

plot(sub$DateTime, sub$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')

dev.off()