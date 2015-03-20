## Read data
if(!exists("NEI"))
    NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))
    SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate data - Baltimore, MD
totals <- aggregate(Emissions ~ year + type, NEI[NEI$fips=='24510',], sum)

## Plot data
png('plot3.png', width=480, height=480)

qplot(x = year, y = Emissions, col = type, data = totals,
      main = 'Plot 3 - Emissions by source type in Baltimore, MD',
      xlab = 'Year', ylab = 'Emissions'
) + geom_line()

dev.off()
