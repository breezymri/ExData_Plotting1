# exploratory data analysis class from coursera
# 2015-02-07
# W. Feng

orig_path <- getwd()


proj1_path <- 'C:\\ds\\R\\exploratory_analysis\\prj1'
setwd(proj1_path)

# read in the data
source('proj1_getdf.R')
data <- proj1_getdf()
# combine date and time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

# plot 2, plot directly to png file
png(file='plot2.png', width=480, height=480)

with(data, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)'))

# write out to device (png file)
dev.off()

# set the working directory back to the original
setwd(orig_path)