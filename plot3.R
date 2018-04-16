1#####################################################################################################
##   NAME: Eric Griffin                                                          Date: Apr-15-2018  ##
## course: Coursera - Exploratory Data Analysis                                                     ##  
##   Assn: Week 1 - Plotting Assignment 1                                                           ##
##   File: plot3.R                                                                                  ##
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
png(filename="plot3.png", height=480, width=480, bg="transparent")


   #extract subset of pow_r date needed in specific date range
   powr_subset = subset(pow_r,as.Date(pow_r$Timestamp) >= "2007-02-01" 
                            & as.Date(pow_r$Timestamp)  < "2007-02-03")

   # Plot the first sub-meter
   plot(powr_subset$Timestamp,
        powr_subset$Sub_metering_1,
        type="l",
        xlab="",
        ylab="Energy sub metering")

        # Plot the second sub-meter
        lines(powr_subset$Timestamp,
              powr_subset$Sub_metering_2,
              type="l",
              col="red")

        # Plot the third sub-meter
        lines(powr_subset$Timestamp,
              powr_subset$Sub_metering_3,
              type="l",
              col="blue")

   # Add the legend
   legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))

#disconnet from the device , and save the plot
dev.off()