
## Check for Load data script and abort if it does not exist in working directory.

if (!file.exists("./LoadHHPCdata.R")) {
  stop("Aborting since  the LoadHHPCdata.R script was not found , please copy LoadHHPCdata.R in your working directory !")
}

# source the Load Data script from working directory

source("LoadHHPCdata.R")


## Plot graph 2

png("plot2.png", width=480, height=480)

with (df_hhpc, plot(Global_active_power ~ Date, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()

