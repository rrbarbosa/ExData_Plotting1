# generate filtered data file if it does not exist
if (!file.exists('filtered_hpc.Rda')) source('filter_data.R')

# load it 
load('filtered_hpc.Rda')

png('plot3.png', height=480, width=480, bg = "transparent")
# TODO: check which vector has the maximum value
#  		this is the one which should be used as argument in plot()
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
dev.off()
