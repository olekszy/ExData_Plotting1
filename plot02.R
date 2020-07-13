
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
df$Date <- as.Date(df$Date, "%d/%m/%Y") #Type Date
df <- subset(df,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2")) #filtering according to instructions
df <- df[complete.cases(df),] #remove incomplete
dateTime <- paste(df$Date, df$Time) #bind two columns
dateTime <- setNames(dateTime, "DateTime")
df <- df[ ,!(names(df) %in% c("Date","Time"))]

df <- cbind(dateTime, df) #adding dateTime
df$dateTime <- as.POSIXct(dateTime)

plot(df$Global_active_power~df$dateTime, 
     type="l", ylab="Global_Active_Power (KW))", 
     xlab="")