##Downloading and unzipping the file using respective functions
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##File downloading
download.file(fileurl, "C:/Users/shreyvish/Documents/ab/R programming/data2.zip")
##File Unzipping
unzip("data2.zip", exdir = "C:/Users/shreyvish/Documents/ab/R programming/data")
##Read the specific data by skipping unnecessary rows and naming columns in the same functions
data <- read.table("./data/household_power_consumption.txt", skip = 66637,
                   nrows = 2880, sep = ";",
                   col.names = c(read.table("./data/household_power_consumption.txt",
                                            nrows = 1, sep = ";")))
##merging Time column and date column in to time column
data$Time <- paste(data$Date,data$Time)
##convert the Date and Time variables to Date/Time classes in R using the as.date and strptime functions
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
##open device png
png("./data/plot2.png")
##use the plot function draw the xy graph
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()