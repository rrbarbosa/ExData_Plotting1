# How long does it take to do all this stuff?
ptm <- proc.time()

# Load consumption file
data <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=';')

# Header contents and example
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000

# Create a new column merging date and time
data <- within(data, DateTime <- paste(Date, Time))

# Remove original date and time colums
data <- subset(data, select = -c(Date, Time))

# Transform DateTime string to time
data <- within(data, DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S"))

# Define start and end time of the analysis
start <- strptime("2007-02-01", "%Y-%m-%d")
end   <- strptime("2007-02-02", "%Y-%m-%d")

# filter using start end end
data <- with(data, data[DateTime > start & DateTime < end, ])

# TODO: need to set the type for the other columns?
# TODO: deal with the question marks '?'

# It took this long (~2min in my box!)
print(proc.time() - ptm)

# Save filtered data
save(data, file="filtered_hpc.Rda")
