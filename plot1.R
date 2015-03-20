## Read data
if(!exists("NEI"))
    NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))
    SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate data
totals <- aggregate(Emissions ~ year, NEI, sum)

## Plot data
png('plot1.png', width=480, height=480)

with(totals,
    barplot(height = Emissions, names = year,
            main = 'Plot 1 - Total PM2.5 emission from all sources',
            xlab = 'Year', ylab = 'Total emissions'
            )
)

dev.off()
