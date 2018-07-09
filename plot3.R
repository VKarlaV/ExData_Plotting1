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

png('plot3.png',width = 480, height = 480)

plot(
  x = df2$New,
  y = as.numeric(df2$Sub_metering_1),
  xlab = '',
  ylab = 'Energy sub metering',
  type = 'l'
)

lines(
  x = df2$New,
  y = as.numeric(df2$Sub_metering_2),
  col = 'red'
      )

lines(
  x = df2$New,
  y = as.numeric(df2$Sub_metering_3),
  col = 'blue'
)

legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()
