#import dataset
power <- read.csv("C:/Users/Hp/Silvia/power.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
 

power2 <-  power[power$Date %in% c("1/2/2007","2/2/2007") ,] #subset the dataset for the 2 dates
na.omit (power2) #remove the NA from the dataset
power2[,4] <- as.numeric (power2[,4]) # set as numeric the variable Global_active_power

png(file = "plot1.png", width=480, height=480) #Open png device and set the dimension of the pic. Graph results better when I did it directly in png
#Command for the histogram
hist (power2$Global_active_power,  col= "red",  main =  "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off #shut down png device

 

