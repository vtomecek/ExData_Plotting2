## Read data
if(!exists("NEI"))
    NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))
    SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate data - Baltimore, MD
totals <- aggregate(Emissions ~ year, NEI[NEI$fips=='24510',], sum)

## Plot data
png('plot2.png', width=480, height=480)

with(totals,
     barplot(height = Emissions, names = year,
             main = 'Plot 2 - Total PM2.5 emission from all sources in Baltimore, MD',
             xlab = 'Year', ylab = 'Total emissions'
     )
)

dev.off()
