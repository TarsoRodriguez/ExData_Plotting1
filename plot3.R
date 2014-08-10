plot3 <- function(){
    library(sqldf)
    file_name <- "./CourseProject1//household_power_consumption.txt"
    DF <- read.csv.sql(file_name, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
    
    DF$DateTime <- paste(DF$Date, DF$Time)
    DF$DateTime <- strptime(DF$DateTime, "%d/%m/%Y %H:%M:%S")
    
    Sys.setlocale("LC_TIME", "English")
    png(file = "plot3.png")
    plot(DF$DateTime, DF$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
    lines(DF$DateTime, DF$Sub_metering_2, col = "orangered")
    lines(DF$DateTime, DF$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "orangered", "blue"), legend = names(DF)[7:9])
    dev.off()
}