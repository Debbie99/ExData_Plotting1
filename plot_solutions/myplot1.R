library("data.table")

setwd("/home/debayan99/R_Projects_WS")

powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )

powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("Plot1.png", width=480, height=480)

hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

dev.off()

