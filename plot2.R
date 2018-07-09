url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if (!file.exists('week1.zip')) {
  download.file(url,'week1.zip')
}

if (!file.exists('week1')) {
  unzip('week1.zip')
}

df1 <- read.table('household_power_consumption.txt',
                  sep=';',
                  colClasses = 'character')

colnames(df1) <- as.character(df1[1,])
df1 <- df1[-1,]

df2 <- subset(df1, Date == '1/2/2007'|Date == '2/2/2007')

df2$Global_active_power <- as.numeric(df2$Global_active_power)
df2$Timestamp <- paste(df2$Date, df2$Time, sep = ' ')
df2$New <- strptime(df2$Timestamp,
                    format = '%d/%m/%Y %H:%M:%S')

png('plot2.png',width = 480, height = 480)

plot(
  x = df2$New,
  y = df2$Global_active_power,
  xlab = '',
  ylab = 'Global Active Power(kilowatts)',
  type = 'l'
)

dev.off()