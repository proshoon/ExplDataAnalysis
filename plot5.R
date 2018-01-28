## Download data from web and unzip locally

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "NEI_data.zip")
unzip("NEI_data.zip", exdir=".", overwrite=TRUE)

## Load data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

balRoadNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]

yearEmissions <- aggregate(Emissions ~ year, balRoadNEI, sum)

png("plot5.png")
g <- ggplot(yearEmissions, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total Emission')) +
  ggtitle('Total Emission from Motor Vehicles in Baltimore from 1999 to 2008')
print(g)
dev.off()

