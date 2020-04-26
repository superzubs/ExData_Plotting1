#'@header Coursera Exploratory Data Analysis Assignment W1
#'@date 27/4/2020
#'@title plot2.R

# 1.0 Download the data 

# 1.1 Declaring filenames and path for download to commence
zip_name = "exdata_data_household_power_consumption.zip"
zipped_url ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file_name = "household_power_consumption.txt"

# 1.2 File Downloading Process
if(!file.exists(file_name) & !file.exists(zip_name)){
  download.file(url = zipped_url,destfile = zip_name,mode = "wb") 
  unzip(zip_name, files = NULL, exdir=".")
}else if(!file.exists(file_name) & file.exists(zip_name)){
  unzip(zip_name, files = NULL, exdir=".")
}

# 2.0 Plot
df = read.table(file_name, header=TRUE, sep=";", stringsAsFactors=FALSE)
df_sub = df[df$Date %in% c("1/2/2007","2/2/2007") ,]

global_active_power <- as.numeric(df_sub$Global_active_power)
dt = strptime(paste0(df_sub$Date," ",df_sub$Time), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(dt, global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
