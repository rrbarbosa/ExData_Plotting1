# TODO: to make it more complete, we could also download the file from the Internet..

# How long does it take to do all this stuff?
ptm <- proc.time()
message("Reading and filterind the dataset. This might take a while...")

# Load consumption file replacing '?' with NA
data <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=';', na.strings=c("?"))

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
end   <- strptime("2007-02-03", "%Y-%m-%d")

# filter using start and end, we need to explicitly remove NA entries
data <-  data[data$DateTime >= start & data$DateTime < end & !is.na(data$DateTime), ]

# It took this long (~2min in my box!)
message(paste("... it took:", (proc.time() - ptm)[3],"seconds"))

# Save filtered data
save(data, file="filtered_hpc.Rda")
