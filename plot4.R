Sys.setlocale("LC_TIME", "English") #Set the time & Date using the English settings

#import dataset
power <- read.csv("C:/Users/Hp/Silvia/power.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

power2 <-  power[power$Date %in% c("1/2/2007","2/2/2007") ,] #subset the dataset for the 2 dates
na.omit (power2) #remove the NA from the dataset
datetime <- paste(power2$Date, power2$Time) #Combined the Date and Time Row in one unique coloumn
power2$datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S") #convert the datetime coloumn in an in Posixct format

power2[,4] <- as.numeric (power2[,4]) ## set as numeric the variable Global_active_power
power2[,5] <- as.numeric (power2[,5]) ## set as numeric the variable Global_reactive_power
power2[,6] <- as.numeric (power2[,6]) ## set as numeric the variable Global_Voltage
power2[,7] <- as.numeric (power2[,7]) ## set as numeric the variable Sub Metering 1
power2[,8] <- as.numeric (power2[,8]) ## set as numeric the variable Sub Metering 2
power2[,9] <- as.numeric (power2[,9]) ## set as numeric the variable Sub Metering 3

png(file = "plot4.png", width=480, height=480)##Open png device and set the dimension of the pic. Graph results better when I did it directly in png
par(mfrow=c(2,2)) ## say that the window is going to be split in 2 rows and 2 cols

plot(power2$datetime, power2$Global_active_power, type="l", xlab= NA, ylab="Global Active Power")

plot(power2$datetime, power2$Voltage, type="l", xlab= "datetime", ylab="Voltage")

plot(power2$datetime, power2$Sub_metering_1, type="s", xlab= NA, ylab="Energy sub metering")
lines(power2$datetime,power2$Sub_metering_2,col="red")
lines(power2$datetime,power2$Sub_metering_3,col="blue")
legend("topright", lty = c(1, 1, 1), col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power2$datetime, power2$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power")

dev.off #shut down png device
