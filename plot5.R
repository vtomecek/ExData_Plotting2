## Read data
if(!exists("NEI"))
    NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))
    SCC <- readRDS("Source_Classification_Code.rds")

## subset ON-ROAD (motor vehicles) & fips=24510 (Baltimore, MD)
NEI.mobile <- subset(NEI, NEI$type=='ON-ROAD' & NEI$fips=='24510')

## Aggregate data
totals <- aggregate(Emissions ~ year, NEI.mobile, sum)

## Plot data
png('plot5.png', width=480, height=480)

with(totals,
     barplot(height = Emissions, names = year,
             main = 'Plot 5 - Motor vehicle-related emissions in Baltimore, MD',
             xlab = 'Year', ylab = 'Emissions'
     )
)

dev.off()
