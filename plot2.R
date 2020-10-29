# Johns Hopskinsn Uiversity
# Data Science.Foundations using R: Exploratory Data Analysis
# Alex  M.
# OCT-NOV 2020

# Plots
# Data Source: UCI Machine Learning Repository
# Individual household electric power consumption Data Set 
# URL: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

#loading libraries
library(lubridate)


# Loading the data 
powerconsump <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE)

#Creating a timestamp variable
DataTime<-dmy_hms(paste(powerconsump$Date,powerconsump$Time))
powerconsump<-cbind(DataTime,powerconsump)

# Converting Data and Time variables format from 'char' to 'Date' and 'Time' respectively
powerconsump$Date<-dmy(powerconsump$Date)
powerconsump$Time<-hms(powerconsump$Time)

# Converting Char variables to numeric
powerconsump$Global_active_power<-as.numeric(powerconsump$Global_active_power)

#NAs manipulating
powerconsump$Global_active_power[is.na(powerconsump$Global_active_power)]<-0

#Subsetting dates between  2007-02-01 and 2007-02-02
powerconsump_1FEB_2FEB_2007<-powerconsump[powerconsump$Date>="2007-02-01" & powerconsump$Date<="2007-02-02", ]

#PLOT 2
plot(powerconsump_1FEB_2FEB_2007$DataTime,powerconsump_1FEB_2FEB_2007$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)")

#Create the PNG file
dev.copy(png,file="plot2.png")
dev.off()

