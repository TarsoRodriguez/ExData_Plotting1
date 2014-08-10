plot2 <- function(){
    library(sqldf)
    file_name <- "./CourseProject1//household_power_consumption.txt"
    DF <- read.csv.sql(file_name, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
    
    DF$DateTime <- paste(DF$Date, DF$Time)
    DF$DateTime <- strptime(DF$DateTime, "%d/%m/%Y %H:%M:%S")
    
    Sys.setlocale("LC_TIME", "English")
    png(file = "plot2.png")
    plot(DF$DateTime, DF$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
    dev.off()
}