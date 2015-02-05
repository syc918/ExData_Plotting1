library(data.table)

# Load data
power <- fread("household_power_consumption.txt", sep=";", header = T)
power[,Date:=as.Date(power$Date, format = "%d/%m/%Y")]
power <- power[Date=="2007-02-01" | Date=="2007-02-02", ]
power[,Global_active_power:=as.numeric(Global_active_power)]

# Convert time column
time <- as.POSIXct(power[,paste(Date,Time)], format = "%Y-%m-%d %H:%M:%S")

# Plot
png('plot3.png', width = 480, height = 480)
plot(time, power[,Sub_metering_1], type="l", lty=1,
        main=NULL,
        xlab="",
        ylab="Energy sub metering")
lines(time, power[,Sub_metering_2], type="l",
      lty=1, col="red") 
lines(time, power[,Sub_metering_3], type="l",
      lty=1, col="blue") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"),lty=1)
dev.off()
