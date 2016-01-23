## EDA Exercise 1
#getwd()
setwd("F:\\Analytics\\Moocs\\DS-Coursera\\Exercise\\EDA")
getwd()

##Reading Data
library("dplyr")
hhpc <- read.csv("household_power_consumption.TXT",sep = ';',stringsAsFactors=FALSE)

head(hhpc)

hhpc$Date_Time <- paste(hhpc$Date,hhpc$Time)
hhpc$Date      <- as.Date(hhpc$Date,'%d/%m/%Y')
hhpc$Time_tmp  <- strptime(hhpc$Date_Time,'%d/%m/%Y %H:%M:%S')
hhpc$weekday   <- strftime(hhpc$Date,'%A')

##Converting character columns to numeric 
for (i in 3:ncol(hhpc)){
  print(class(hhpc[,i]))
  if (class(hhpc[,i]) == 'character'){
    #hhpc[i] <- as.numeric(as.matrix(hhpc[i]))
    hhpc[,i] <- as.numeric(hhpc[,i])
  }
}

hhpc$Date_Time <- NULL

summary(hhpc$Date)
head(hhpc)
hhpc_full <- tbl_df(hhpc)
hhpc_full

#Filtering the data
hhpc_tr <- hhpc_full[hhpc_full$Time_tmp >= as.POSIXlt('2007-02-01 00:00:00') & hhpc_full$Time_tmp<= as.POSIXlt('2007-02-02 23:59:00'),]
head(hhpc_tr)

# Histogram
par(mfrow = c(1,1))
hist(hhpc_tr$Global_active_power,xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", main = "Global Active Power",col = "red")
png(filename = 'plot1.png')
dev.off()
