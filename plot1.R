# Assuming your data file is in your working directory, read the household_power_consumption.txt file into the variable 
#householdPower veriable with the read.table comand. Set stringsAsFactors = FALSE to avoid converting factors to numbers
householdPower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# conver the column Data to date values
householdPower$Date <- as.Date(householdPower$Date, "%d/%m/%Y")

# pull out only those readings that are found in 2007-02-01 to 2007-02-02
householdPower <- subset(householdPower, Date > "2007-01-31" & Date < "2007-02-03")

# Create the png file and write it to my git repository
png(filename = "/home/linda/git/ExData_Plotting1/plot1.png", width = 480, height = 480)

# Create this required histogram in one command. Set color, labels and y axis limits
hist(as.numeric(householdPower$Global_active_power), col="red", main="Global Active Power", xlab = "Global Active Power (Kilowatts)", ylim = c(0, 1200))

#turn off the device
dev.off()
