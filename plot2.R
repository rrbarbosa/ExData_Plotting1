# generate filtered data file if it does not exist
if (!file.exists('filtered_hpc.Rda')) source('filter_data.R')

# load it 
load('filtered_hpc.Rda')

png('plot2.png', height=480, width=480)
with(data, plot(DateTime, Global_active_power,
			   	type="n",
				xlab="",
				ylab="Global Active Power (kilowatts)"))
with(data, lines(DateTime, Global_active_power))
dev.off()
