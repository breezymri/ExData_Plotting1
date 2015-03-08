# exploratory data analysis class from coursera
# W. Feng

orig_path <- getwd()


proj1_path <- 'C:\\ds\\R\\exploratory_analysis\\prj1'
setwd(proj1_path)

# read in the data
source('proj1_getdf.R')
data <- proj1_getdf()

# plot 1, plot directly to png file
png(file='plot1.png', width=480, height=480)
with(data, hist(Global_active_power, col='RED', 
    main='Global Active Power', 
    xlab='Global Active Power (kilowatts)'))
# write out to device (png file)
dev.off()

# set the working directory back to the original
setwd(orig_path)