#'@header Coursera Exploratory Data Analysis Assignment W1
#'@date 27/4/2020
#'@title plot1.R

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

# Check Class
sapply(df_sub,class)

global_active_power = as.numeric(df_sub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
