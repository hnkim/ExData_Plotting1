setwd("~/Dropbox/Coursera/R codes/04_EDA/Project_1/data")

## Read Data
df <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings ="?",
                 colClasses = c("character", "character","numeric","numeric",
                                "numeric","numeric","numeric", "numeric", "numeric"))

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df1 <- subset(df, df$Date %in% as.Date(c("2007-02-01","2007-02-02")))

df2 <- cbind(df1, date_time = strptime(paste(df1$Date, df1$Time), "%Y-%m-%d %H:%M:%S"))

rm(df, df1)

# Plot 2 - Line

par(cex = .8)

plot(df2$date_time,df2$Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(df2$date_time,df2$Global_active_power, type="l")

dev.copy(png, file = "plot2.png") ## copy plot to a PNG file
dev.off()
