######################################################################################################
##   NAME: Eric Griffin                                                          Date: Apr-15-2018  ##
## course: Coursera - Exploratory Data Analysis                                                     ##  
##   Assn: Week 1 - Plotting Assignment 1                                                           ##
##   File: plot2.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##          Our overall goal here is simply to examine how household energy usage varies            ##
##          over a 2-day period in February, 2007 and recreate the plots specified                  ## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


## open and read in the Data from my EDA data folder 
pow_r <- read.csv("../EDA/household_power_consumption.txt",
                  sep=";",
                  colClasses=c(rep("character",2),rep("numeric",7)),
                  na.strings="?")

# concat the date and time to make a timestamp
pow_r$Timestamp <- strptime(paste(pow_r$Date,pow_r$Time),format="%d/%m/%Y %H:%M:%S")
pow_r$Time=NULL
pow_r$Date=NULL



# connect to png graphics file as device
png(filename="plot2.png", height=480, width=480, bg="transparent")

   #extract subset of pow_r date needed in specific date range
   powr_subset = subset(pow_r,as.Date(pow_r$Timestamp) >= "2007-02-01" 
                     & as.Date(pow_r$Timestamp) < "2007-02-03")


   # Plot the line
   plot(powr_subset$Timestamp,
        powr_subset$Global_active_power,
        type="l",
        xlab="",
        ylab="Global Active Power (kilowatts)")

#disconnet from the device , and save the  plot
dev.off()