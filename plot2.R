## get url and download the datafile from the web-site
url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./Dataset.zip")

## unzip data to current path. see files in the unpacked folder.
unzip("./Dataset.zip")
print(list.files(recursive = TRUE))

data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", nrows =  2075259, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data [(data$Date == as.Date("2007-02-01")|data$Date == as.Date("2007-02-02")), ]
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

#data$Weekday <- factor(weekdays(data$Date)) 
png(file = "plot2.png")
plot(data$DateTime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()