Sys.setlocale("LC_TIME", "English") #Set the time & Date using the English settings

#import dataset
power <- read.csv("C:/Users/Hp/Silvia/power.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

power2 <-  power[power$Date %in% c("1/2/2007","2/2/2007") ,] #subset the dataset for the 2 dates
na.omit (power2) #remove the NA from the dataset

time <- paste(power2$Date, power2$Time) #Combined the Date and Time Row in one unique coloumn
power2$Time <- strptime(time, "%d/%m/%Y %H:%M:%S") #convert the datetime coloumn in an in Posixct format

power2[,7] <- as.numeric (power2[,7]) ## set as numeric the variable Sub Metering 1
power2[,8] <- as.numeric (power2[,8]) ## set as numeric the variable Sub Metering 2
power2[,9] <- as.numeric (power2[,9]) ## set as numeric the variable Sub Metering 3

png(file = "plot3.png", width=480, height=480)  #Open png device and set the dimension of the pic. Graph results better when I did it directly in png

plot(power2$Time, power2$Sub_metering_1, type="s", xlab= NA, ylab="Energy sub metering") #set the type of graph, its axes and plot Time vs Submetering 1 
lines(power2$Time,power2$Sub_metering_2,col="red") #plot Time vs Submetering 2 
lines(power2$Time,power2$Sub_metering_3,col="blue") #plot Time vs Submetering 3 
legend("topright", lty = c(1, 1, 1), col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #set the legend

dev.off #shut down png device
