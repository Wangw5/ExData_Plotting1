df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = F)
head(df)
str(df)
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S") 
df$Date <- as.Date(df$Date,format = "%d/%m/%Y")
df2 <- subset(df, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
df2 <- df2[order(df2$Time),]


#### Plot3 ####
png("plot3.png")
with(df2, {plot(Time, Sub_metering_1, ,xlab= "", ylab = "Energy sub metering", type = "l")
           lines(Time, Sub_metering_2, col = "red")
           lines(Time, Sub_metering_3, col = "blue")
           legend("topright", lty = 1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))})
dev.off()