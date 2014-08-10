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

# Plot 1 - Historgram

par(bg= "transparent", cex = .8)

hist(df2$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png") ## copy plot to a PNG file
dev.off()
