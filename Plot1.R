
## Check for Load data script and abort if it does not exist in working directory.

if (!file.exists("./LoadHHPCdata.R")) {
  stop("Aborting since  the LoadHHPCdata.R script was not found , please copy LoadHHPCdata.R in your working directory !")
}

# source the Load Data script from working directory

source("LoadHHPCdata.R")


# Plot graph 1 

png("plot1.png", width=480, height=480)

hist(df_hhpc$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (Kilowatts)",col="red")

dev.off()



