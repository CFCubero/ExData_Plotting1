
##Set working directory and download the file

if (file.exists("./data")){
    setwd("./data")
} else {
    dir.create("./data")
    setwd("./data")
}
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file<-"data.zip"
download.file(url,file,method="libcurl")
unzip(file, exdir = ".")

##Reading and formating the data

setwd("D:/1. Cursos/Data Science/Modulo 4. Análisis exploratorio de datos/Week 1/Proyect")
coln<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<-read.table("household_power_consumption.txt",header=F,sep=";",na.strings = c("NA","?"),skip=66637,nrows=2880,col.names=coln)
data$Date<-as.Date(data$Date,format="%d/%m/%Y");data$Time<-strptime(data$Time,format="%H:%M:%S")

## Open the device, plot and close the Device

png(file="plot3.png")
plot(data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n")
axis(1,c(1,nrow(data)/2,nrow(data)),c("Thu", "Fri", "Sat"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
dev.off()

