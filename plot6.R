## Read data
if(!exists("NEI"))
    NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC"))
    SCC <- readRDS("Source_Classification_Code.rds")

## subset ON-ROAD (motor vehicles) 
# & fips=24510 (Baltimore, MD) | fips=06037 (Los Angeles, CA)
NEI.mobile <- subset(NEI, NEI$type=='ON-ROAD' & (NEI$fips=='24510' | NEI$fips=='06037'))

## Aggregate data
totals <- aggregate(Emissions ~ year + fips, NEI.mobile, sum)

## Add fips names to totals
fips <- c('24510', '06037')
names <- c('Baltimore, MD', 'Los Angeles, CA')
df <- data.frame(fips, names)
totals <- merge(totals, df)

## Plot data
png('plot6.png', width=480, height=480)

ggplot(totals, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat = "identity") +
    facet_grid(. ~ names) +
    ggtitle('Plot 6 - Motor vehicle-related emissions in Baltimore, MD vs Los Angeles, CA') +
    xlab('Year')

dev.off()
