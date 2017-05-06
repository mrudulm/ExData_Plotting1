
## Check for Load data script and abort if it does not exist in working directory.

if (!file.exists("./LoadHHPCdata.R")) {
  stop("Aborting since  the LoadHHPCdata.R script was not found , please copy LoadHHPCdata.R in your working directory !")
}

# source the Load Data script from working directory

source("LoadHHPCdata.R")


## Plot graph 3


png("plot3.png", width=480, height=480)

with(df_hhpc, plot(Date, Sub_metering_1,ylab="Energy Sub Metering", xlab="",type = "n"))
with(df_hhpc, points(Date, Sub_metering_1, col = "black",type="l")) 
with(df_hhpc, points(Date, Sub_metering_2, col = "red",type="l"))
with(df_hhpc, points(Date, Sub_metering_3, col = "blue",type="l"))
legend("topright",lwd=2, cex=1.2, y.intersp=1.4, lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

dev.off()


