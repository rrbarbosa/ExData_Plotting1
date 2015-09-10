# generate filtered data file if it does not exist
if (!file.exists('filtered_hpc.Rda')) source('filter_data.R')

# load it 
load('filtered_hpc.Rda')

png('plot4.png', height=480, width=480, bg = "transparent")
par(mfrow = c(2, 2))
# plot 1,1
with(data, plot(DateTime, Global_active_power,
			   	type="n",
				xlab="",
				ylab="Global Active Power"))
with(data, lines(DateTime, Global_active_power))

# plot 1,2
with(data, plot(DateTime, Voltage,
			   	type="n",
				xlab="datetime",
				ylab="Voltage"))
with(data, lines(DateTime, Voltage))

# plot 2,1
with(data, plot(DateTime, Sub_metering_1,
			   	type="n",
				xlab="",
				ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1, col="black"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",
	   c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	   col=c("black","red","blue"),
	   lty=1)
# plot 2,2
with(data, plot(DateTime, Global_reactive_power,
			   	type="n",
				xlab="datetime",
				ylab="Global_reactive_power"))
with(data, lines(DateTime, Global_reactive_power))
dev.off()
