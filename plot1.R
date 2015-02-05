library(data.table)

# Load data
power <- fread("household_power_consumption.txt", sep=";", header = T)
power[,Date:=as.Date(power$Date, format = "%d/%m/%Y")]
power <- power[Date=="2007-02-01" | Date=="2007-02-02", ]
power[,Global_active_power:=as.numeric(Global_active_power)]

# Plot histogram with appropriate labeling
png('plot1.png', width = 480, height = 480)
hist(power[,Global_active_power], 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.off()
