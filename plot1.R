url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if (!file.exists('week1.zip')) {
  download.file(url,'week1.zip')
}

if (!file.exists('week1')) {
  unzip('week1.zip')
}

df1 <- read.table('household_power_consumption.txt',sep=';',colClasses = 'character')
colnames(df1) <- as.character(df1[1,])
df1 <- df1[-1,]

df2 <- subset(df1, Date == '1/2/2007'|Date == '2/2/2007')

png('plot1.png', width = 480, height = 480)

hist(as.numeric(df2$Global_active_power), 
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     col = 'red',
     main = 'Global Active Power')

dev.off()
