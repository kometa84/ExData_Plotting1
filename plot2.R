Sys.setlocale("LC_TIME", "English") #Set the time & Date using the English settings

#import dataset
power <- read.csv("C:/Users/Hp/Silvia/power.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
power2 <-  power[power$Date %in% c("1/2/2007","2/2/2007") ,] #subset the dataset for the 2 dates
na.omit (power2) #remove the NA from the dataset

time <- paste(power2$Date, power2$Time) #Combined the Date and Time Row in one unique coloumn
power2$Time <- strptime(time, "%d/%m/%Y %H:%M:%S") #convert the datetime coloumn in an in Posixct format

power2[,4] <- as.numeric (power2[,4]) # set as numeric the variable Global_active_power

png(file = "plot2.png", width=480, height=480) #Open png device and set the dimension of the pic. Graph results better when I did it directly in png
plot(power2$Time, power2$Global_active_power, type="l", xlab= NA, ylab="Global Active Power (kilowatts)")
dev.off #shut down png device
