## assignment for week 1 of Exploratory Data Analysis Course

library(lubridate)

#calculate memory usage
size <- round(2075259*9*10/2^{20}/1024, 2)
            # num rows * num cols * 10 bytes (assuming characters)
            # divided by 2 to the 20th to get MB required
            # divided by 1024 to get GB required
            # round final number to 2 decimal places
            # ended up with 0.17GB

tester <- read.table("household_power_consumption.txt", 
                    header=TRUE, 
                    sep=";",
                    stringsAsFactors = FALSE)

#modify the Dat & Time fields, then concatinate them into new, DT field
tester$Date <- dmy(tester$Date)
tester$Time <- as.character(tester$Time)
tester$DT <- ymd_hms(paste(tester$Date, tester$Time))
      #tester$DT is of class "POSIXct" "POSIXt"

#subset the data frame
tester2 <- subset.data.frame(tester, 
                             tester$Date=="2007-02-01" | 
                             tester$Date=="2007-02-02")

#convert Global_active_power to be a useable number
tester2$Global_active_power <- as.numeric(tester2$Global_active_power)

#be sure the display is set-up to just show 1 graph
par(mfrow=c(1,1))

#Create histogram
hist(tester2$Global_active_power, 
     col="red",
     main = "Global Active Power",
     ylim = c(0,1200),
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.copy(png, file="plot1.png") #default is 480x480
dev.off()

