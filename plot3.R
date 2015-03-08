# exploratory data analysis class from coursera
# W. Feng

orig_path <- getwd()


proj1_path <- 'C:\\ds\\R\\exploratory_analysis\\prj1'
setwd(proj1_path)

# read in the data
source('proj1_getdf.R')
data <- proj1_getdf()
# combine date and time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

# plot 3, plot directly to png file
png(file='plot3.png', width=480, height=480)

plot(data$DateTime, data$Sub_metering_1, type='l', col='BLACK', ylab='Energy sub metering')
lines(data$DateTime, data$Sub_metering_2, type='l', col='RED')
lines(data$DateTime, data$Sub_metering_3, type='l', col='BLUE')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('BLACK', 'RED', 'BLUE'), lwd=2, lty=1)

# write out to device (png file)
dev.off()

# set the working directory back to the original
setwd(orig_path)