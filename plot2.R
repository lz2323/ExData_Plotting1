## Exploratory Data Analysis 
## Course Project 1
## 2018-10-24
## lz

# load data
library(sqldf)
powerdata <- read.csv.sql("f:/household_power_consumption.txt", 
                          sql = "select * from file where Date 
                          in ('1/2/2007','2/2/2007')",
                          sep = ";")
power1 <- powerdata
power1$DateTime <- strptime(paste(power1$Date, power1$Time), '%d/%m/%Y %H:%M:%S')

# plot
with(power1, plot(DateTime, Global_active_power, type = 'l', ann = F))
title(ylab = 'Global Active Power(kilowatts)')

# output
dev.copy(png,"F:/gitrepo/ExData_Plotting1/plot2.png",width = 480, height = 480)
dev.off()



