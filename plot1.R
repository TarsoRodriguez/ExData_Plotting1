plot1 <- function(){
    library(sqldf)
    file_name <- "./CourseProject1//household_power_consumption.txt"
    DF <- read.csv.sql(file_name, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
    
    png(file = "plot1.png")
    hist(DF$Global_active_power, main = "Global Active Power", col = "orangered", xlab = "Global Active Power (Kilowatts)")
    dev.off()
}