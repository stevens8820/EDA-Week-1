#Plot 1 Function 

plot1 <- function(){
    #Read in initial dataset
    
    df <- read.table("./household_power_consumption.txt" , stringsAsFactors = FALSE , header = TRUE , sep =  ";")
    
    
    #reclass the columns to the correct class
    
    df$Date <- as.Date(df$Date , format = "%d/%m/%Y")
    df$Time <- format(df$Time, format = "%H,%M,%S")
    df$Global_active_power <- as.numeric(df$Global_active_power)
    df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
    df$Voltage <- as.numeric(df$Voltage)
    df$Global_intensity <- as.numeric(df$Global_intensity)
    df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
    df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
    df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
    
    
    
    #Subset the reclasses dataset to meet Date classification 
    
    
    subsetdf <- subset(df , Date == "2007-02-01" | Date == "2007-02-02")
    
    
    #Plot Histogram for the 2 day period 
    
    
    png("Plot1.png" , width = 480, height =480)
    hist(subsetdf$Global_active_power, col = "red",border = "black", main = "Global Active Power" , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency")
    dev.off()
    
}

