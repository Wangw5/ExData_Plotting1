df <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?", stringsAsFactors = F)
head(df)
str(df)
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S") 
df$Date <- as.Date(df$Date,format = "%d/%m/%Y")
df2 <- subset(df, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
df2 <- df2[order(df2$Time),]

#### Plot1 ####
png("plot1.png")
with(df2, hist(Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()