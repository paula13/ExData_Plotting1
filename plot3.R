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



png("plot3.png",width=480,height = 480)
with(data_feb,plot(Time,Sub_metering_1,type="n",ylab="Energy sub metering"))
with(data_feb,lines(Time,Sub_metering_1,col="black"))
with(data_feb,lines(Time,Sub_metering_2,col="blue"))
with(data_feb,lines(Time,Sub_metering_3,col="red"))
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

