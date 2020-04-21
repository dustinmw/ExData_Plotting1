# load and structure dataset

variable.class<-c(rep('character',2),rep('numeric',7))

dataload <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                       header=TRUE, sep=';',na.strings='?',colClasses=variable.class, col.names = 
                         c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
                          'SubMetering1','SubMetering2','SubMetering3'))

dataload<-dataload[dataload$Date=='1/2/2007' | dataload$Date=='2/2/2007',]

dataload$Date <- as.Date(dataload$Date, format = '%d/%m/%Y')

dataload$DateTime <- strptime(paste(dataload$Date, dataload$Time),"%Y-%m-%d %H:%M:%S")



# create and save plots

png(filename='./plots/plot1.png',width=480,height=480,units='px')


hist(dataload$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')


x<-dev.off()