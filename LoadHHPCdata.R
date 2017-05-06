
# Load requiered packages

if(!require("sqldf")){
  
  install.packages("sqldf")
  
  if(!require("sqldf")){
    
    #If Installation fails aborting...
    
    stop("Aborting since  the script couldnt install sqldf package!")
    
  }
  
}
if(!require("lubridate")){
  
  install.packages("lubridate")
  
  if(!require("lubridate")){
    
    #If Installation fails aborting...
    
    stop("Aborting since  the script couldnt install lubridate package!")
    
  }
  
}


# Load required libraries

library(sqldf)
library(lubridate)

# Define variables for source url and desitnation file name
file.name <- "household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip.file  <- "./data.zip"

# Check if the data is downloaded and download when applicable
if (!file.exists("./household_power_consumption.txt")) {
  download.file(url, destfile = zip.file)
  unzip(zip.file)
  file.remove(zip.file)
}

df_hhpc <- read.csv.sql(file.name,sql= "select * from file where Date == '1/2/2007' OR Date == '2/2/2007' " , sep=";")

## Converting Date variables into date time and merging using lubridate

df_hhpc$Date <- dmy_hms(paste(df_hhpc$Date,df_hhpc$Time)) 


## Remove incomplete observation
df_hhpc <- df_hhpc[complete.cases(df_hhpc),]

closeAllConnections()