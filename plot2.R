df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = F)
head(df)
str(df)
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S") 
df$Date <- as.Date(df$Date,format = "%d/%m/%Y")
df2 <- subset(df, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
df2 <- df2[order(df2$Time),]

#### Plot2 ####
png("plot2.png")
with(df2, plot(Time, Global_active_power,xlab= "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()