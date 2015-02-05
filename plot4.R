library(data.table)

# Load data
power <- fread("household_power_consumption.txt", sep=";", header = T)
power[,Date:=as.Date(power$Date, format = "%d/%m/%Y")]
power <- power[Date=="2007-02-01" | Date=="2007-02-02", ]
power[,Global_active_power:=as.numeric(Global_active_power)]

# Convert time column
time <- as.POSIXct(power[,paste(Date,Time)], format = "%Y-%m-%d %H:%M:%S")

# Plot
png('plot4.png', width = 480, height = 480)

# Set up the grid
par(mfrow=c(2,2))

# Plot 1
plot(time, power[,Global_active_power], type="l",
     main=NULL,
     xlab="",
     ylab="Global Active Power")
# Plot 2
plot(time, power[,Voltage], type="l",
     main=NULL,
     xlab="datetime",
     ylab="Voltage")

# Plot 3
plot(time, power[,Sub_metering_1], type="l", lty=1,
     main=NULL,
     xlab="",
     ylab="Energy sub metering")
lines(time, power[,Sub_metering_2], type="l",
      lty=1, col="red") 
lines(time, power[,Sub_metering_3], type="l",
      lty=1, col="blue") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"),lty=1,bty = "n")

# Plot 4
plot(time, power[,Global_reactive_power], type="l",
     main=NULL,
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
