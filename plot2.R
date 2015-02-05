library(data.table)

# Load data
power <- fread("household_power_consumption.txt", sep=";", header = T)
power[,Date:=as.Date(power$Date, format = "%d/%m/%Y")]
power <- power[Date=="2007-02-01" | Date=="2007-02-02", ]
power[,Global_active_power:=as.numeric(Global_active_power)]

# Convert time column
time <- as.POSIXct(power[,paste(Date,Time)], format = "%Y-%m-%d %H:%M:%S")

# Plot
png('plot2.png', width = 480, height = 480)
plot(time, power[,Global_active_power], type="l",
     main=NULL,
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
