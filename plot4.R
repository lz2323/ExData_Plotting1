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

par(mfcol = c(2,2))

# plot1
with(power1, plot(DateTime, Global_active_power, type = 'l', ann = F))
title(ylab = 'Global Active Power(kilowatts)')

# plot2
with(power1, plot(DateTime, Sub_metering_1, type = 'n', ann = F))
title(ylab = 'Energy sub metering')

with(power1, lines(DateTime, Sub_metering_1, type = 'l',col = 'grey50'))
with(power1, lines(DateTime, Sub_metering_2, type = 'l',col = 'red'))
with(power1, lines(DateTime, Sub_metering_3, type = 'l',col = 'blue'))
legend('topright', lty = c(1,1,1), col = c('grey50', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       bty = 'n',cex = 0.7)

# plot3
with(power1, plot(DateTime, Voltage, type = 'l', xlab = 'datatime'))

# plot4
with(power1, plot(DateTime, Global_reactive_power, type = 'l', xlab = 'datatime'))

# output
dev.copy(png,"F:/gitrepo/ExData_Plotting1/plot4.png",width = 480, height = 480)
dev.off()

