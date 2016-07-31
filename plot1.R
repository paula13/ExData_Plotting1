library(base)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
data_elpower <- read.table("household_power_consumption-2.txt",sep=";",header=TRUE)
names(data_elpower)
data_elpower$Date <- as.Date(data_elpower$Date,format="%d/%m/%Y")
data_elpower$Time <- strptime(paste(data_elpower$Date,data_elpower$Time," "),format="%Y-%m-%d %H:%M:%S")

date1 <- as.Date("2007-02-01",format="%Y-%m-%d")
date2 <- as.Date("2007-02-02",format="%Y-%m-%d")

data_feb <- data_elpower[data_elpower$Date >= date1 & data_elpower$Date <= date2,]

data_feb$Global_active_power <- suppressWarnings(as.numeric(levels(data_feb$Global_active_power))[data_feb$Global_active_power])



png("plot1.png",width=480,height = 480)
hist(data_feb$Global_active_power,col="red",
     xlab="Global active power (kilowatts)",
     main="Global active power")
dev.off()