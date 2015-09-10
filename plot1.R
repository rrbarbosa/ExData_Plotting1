# generate filtered data file if it does not exist
if (!file.exists('filtered_hpc.Rda')) source('filter_data.R')

# load it 
load('filtered_hpc.Rda')

# histogram for active power
png('plot1.png')
with(data, hist(Global_active_power, 
				col="red",
			   	main="Global Active Power",
				xlab="Global Active Power (kilowatts)"))
dev.off()

