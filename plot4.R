setwd("~/Documents/Coursera/04_Exploratory Data Analysis/Projects/ExData_Plotting1")

myfile <- "~/Documents/Coursera/04_Exploratory Data Analysis/Projects/Project_1/data/household_power_consumption.txt"

## Read Data
df <- read.table(myfile, header = T, sep = ";", na.strings ="?",
                 colClasses = c("character", "character","numeric","numeric",
                                "numeric","numeric","numeric", "numeric", "numeric"))

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df1 <- subset(df, df$Date %in% as.Date(c("2007-02-01","2007-02-02")))

df2 <- cbind(df1, date_time = strptime(paste(df1$Date, df1$Time), "%Y-%m-%d %H:%M:%S"))

rm(df, df1)

# Plot 4 - Multi Frame Plots

par(mfrow = c(2,2),  mar = c(4, 4, 2, 1), bg= "transparent", cex=.7)

#R1-1
plot(df2$date_time,df2$Global_active_power, type="n", xlab = "", ylab = "Global Active Power")
lines(df2$date_time,df2$Global_active_power)

#R1-2
plot(df2$date_time,df2$Voltage, type="n", xlab = "datetime", ylab = "Voltage")
lines(df2$date_time,df2$Voltage)

#R2-1
plot(df2$date_time,df2$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(df2$date_time,df2$Sub_metering_1, type="l")
lines(df2$date_time,df2$Sub_metering_2, type="l", col = "red")
lines(df2$date_time,df2$Sub_metering_3, type="l", col = "blue")
legend("topright", bty="n", lty = c(1,1,1), col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#R2-2
plot(df2$date_time,df2$Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reacctive_power")
lines(df2$date_time,df2$Global_reactive_power)


dev.copy(png, file = "plot4.png") ## copy plot to a PNG file
dev.off()
