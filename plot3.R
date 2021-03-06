#load the lubridate library
library(lubridate)

# read in the household_power_consumption.txt, setting stringAsFactor=FALSE

householdPower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# conver the column Data to date values
householdPower$Date <- as.Date(householdPower$Date, "%d/%m/%Y")

# pull out only those readings that are found in 2007-02-01 to 2007-02-02
householdPower <- subset(householdPower, Date > "2007-01-31" & Date < "2007-02-03")

# Create a new field with Date and Time concatinated
householdPower$DateTime <- with(householdPower, paste0(Date, " ", Time))

# change class to Date
householdPower$DateTime <-as.numeric(ymd_hms(householdPower$DateTime))

# Create the png file and write it to my git repository
png(filename = "/home/linda/git/ExData_Plotting1/plot3.png", width = 480, height = 480)

# Plot the data; type="l" produces the line chart needed for this exercise

with(householdPower, {
        plot(DateTime, Sub_metering_1, type="l", xaxt="n", ylab = "Energy sub metering", xlab="", ylim = c(0,40))
        par(new=TRUE)
        plot(DateTime, Sub_metering_2, type="l", xaxt="n", yaxt ="n", col="red", ylab="", xlab="", ylim = c(0,40))
        par(new=TRUE)
       plot(DateTime, Sub_metering_3, type="l", xaxt="n", yaxt ="n", col="blue", ylab="", xlab="", ylim = c(0,40))
})


# Calculate the x-axis labels
label1 <- as.character(wday("2007-02-01", label = TRUE))
label2 <- as.character(wday("2007-02-02", label = TRUE))
label3 <- as.character(wday("2007-02-03", label = TRUE))

#Add labels to the plot
axis(1, at = c(min(householdPower$DateTime), median(householdPower$DateTime), max(householdPower$DateTime)), labels=c(label1, label2, label3))

#Legend
legend("topright", pch = c("_","_","_"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#turn off the device
dev.off()
