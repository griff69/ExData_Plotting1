######################################################################################################
##   NAME: Eric Griffin                                                          Date: Apr-15-2018  ##
## course: Coursera - Exploratory Data Analysis                                                     ##  
##   Assn: Week 1 - Plotting Assignment 1                                                           ##
##   File: plot4.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##          Our overall goal here is simply to examine how household energy usage varies            ##
##          over a 2-day period in February, 2007 and recreate the plots specified                  ## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


## open and read in the Data from my EDA data folder 
pow_r <- read.csv("EDA/datahousehold_power_consumption.txt",
                  sep=";",
                  colClasses=c(rep("character",2),rep("numeric",7)),
                  na.strings="?")

# concat the date and time to make a timestamp
pow_r$Timestamp <- strptime(paste(pow_r$Date,pow_r$Time),format="%d/%m/%Y %H:%M:%S")
pow_r$Time=NULL
pow_r$Date=NULL



# connect to png graphics file as device
png(filename="plot4.png", height=480, width=480, bg="transparent")


    #extract subset of pow_r date needed in specific date range
    powr_subset = subset(pow_r,as.Date(pow_r$Timestamp) >= "2007-02-01" 
                     & as.Date(pow_r$Timestamp) < "2007-02-03")

    #create a multi-paneled window
    par(mfrow=c(2,2))

        #Panel1 -ActivePower / Datetime

          plot(powr_subset$Timestamp,
             powr_subset$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power")

        #Panel2 -  time / voltage

          plot(powr_subset$Timestamp,
             powr_subset$Voltage,
             type="l",
             xlab="datetime",
             ylab="Voltage")


        #Panel3 - multi sub-meters

           # sub-meter#1
           plot(powr_subset$Timestamp,
                powr_subset$Sub_metering_1,
                type="l",
                xlab="",
                ylab="Energy sub metering")

             # sub-meter#2
             lines(powr_subset$Timestamp,
                   powr_subset$Sub_metering_2,
                   type="l",
                   col="red")

             # sub-meter#3
             lines(powr_subset$Timestamp,
                   powr_subset$Sub_metering_3,
                   type="l",
                    col="blue")

          # place legend on plot in top righthand corner
          legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 lty=c(1,1),
                 lwd=2,   col=c("black","red","blue"),
                 bty="n")

       #Panel4 global reactive power 

       plot(powr_subse$Timestamp,
            powr_subse$Global_reactive_power,
            type="l",
            xlab="datetime",
            ylab="Global_reactive_power")

#disconnet from the device , and save the plots
dev.off()
