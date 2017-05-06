
## Check for Load data script and abort if it does not exist in working directory.

if (!file.exists("./LoadHHPCdata.R")) {
  stop("Aborting since  the LoadHHPCdata.R script was not found , please copy LoadHHPCdata.R in your working directory !")
}

# source the Load Data script from working directory

source("LoadHHPCdata.R")




png ("plot4.png", width=480, height=480)

# Settting the display device for 4 graphs

par(mfrow=c(2,2))


## Plotting 4 graphs 

#1
with(df_hhpc,plot(Date,Global_active_power,type="l",ylab = "Global Active Power",xlab=""))

#2
with(df_hhpc,plot(Date,Voltage,type="l",ylab = "Voltage",xlab="datetime"))

#3
with(df_hhpc, plot(Date, Sub_metering_1,ylab="Energy Sub Metering", xlab="",type = "n"))
with(df_hhpc, points(Date, Sub_metering_1, col = "black",type="l")) 
with(df_hhpc, points(Date, Sub_metering_2, col = "red",type="l"))
with(df_hhpc, points(Date, Sub_metering_3, col = "blue",type="l"))
legend("topright",lwd=2, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4
with(df_hhpc,plot(Date,Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab="datetime"))


dev.off()















