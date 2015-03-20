## Read data
if(!exists("NEI"))
    NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))
    SCC <- readRDS("Source_Classification_Code.rds")

## Subset coal data
coali <- grep('Coal', SCC$EI.Sector)    # ids of SCC
SCC.coal <- SCC[coali, ]$SCC            # coal-related SCCs
NEI.coal <- subset(NEI, NEI$SCC %in% SCC.coal)

## Aggregate data
totals <- aggregate(Emissions ~ year, NEI.coal, sum)

## Plot data
png('plot4.png', width=480, height=480)

with(totals,
     barplot(height = Emissions, names = year,
             main = 'Plot 4 - Coal-related emissions across the US',
             xlab = 'Year', ylab = 'Emissions'
     )
)

dev.off()
