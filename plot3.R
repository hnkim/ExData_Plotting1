setwd("~/Dropbox/Coursera/R codes/04_EDA/Project_1")

## Read Data
df <- read.table("data/household_power_consumption.txt", header = T, sep = ";", na.strings ="?",
                 colClasses = c("character", "character","numeric","numeric",
                                "numeric","numeric","numeric", "numeric", "numeric"))

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df1 <- subset(df, df$Date %in% as.Date(c("2007-02-01","2007-02-02")))

df2 <- cbind(df1, date_time = strptime(paste(df1$Date, df1$Time), "%Y-%m-%d %H:%M:%S"))

rm(df, df1)

# Plot 3 - Multiple Lines

par(cex = .8)

plot(df2$date_time,df2$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(df2$date_time,df2$Sub_metering_1, type="l")
lines(df2$date_time,df2$Sub_metering_2, type="l", col = "red")
lines(df2$date_time,df2$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "plot3.png") ## copy plot to a PNG file
dev.off()
