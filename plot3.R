#'@header Coursera Exploratory Data Analysis Assignment W1
#'@date 27/4/2020
#'@title plot3.R

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

dt = strptime(paste0(df_sub$Date," ",df_sub$Time), "%d/%m/%Y %H:%M:%S") 

Sub_metering_1 = as.numeric(df_sub$Sub_metering_1)
Sub_metering_2 = as.numeric(df_sub$Sub_metering_2)
Sub_metering_3 = as.numeric(df_sub$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dt, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, Sub_metering_2, type="l", col="red")
lines(dt, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5,
       col=c("black", "red", "blue"))
dev.off()
