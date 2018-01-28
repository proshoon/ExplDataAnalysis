## Download data from web and unzip locally

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "NEI_data.zip")
unzip("NEI_data.zip", exdir=".", overwrite=TRUE)

## Load data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (). Which city has seen greater changes over time in motor vehicle emissions?

balLARoadNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
yearLocEmissions <- aggregate(Emissions ~ year + fips, balLARoadNEI, sum)
yearLocEmissions$fips[yearLocEmissions$fips=="24510"] <- "Baltimore"
yearLocEmissions$fips[yearLocEmissions$fips=="06037"] <- "Los Angeles"

png("plot6.png")
g <- ggplot(yearLocEmissions, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("Year") +
  ylab(expression("Total Emission")) +
  ggtitle("Total Emission from Motor Vehicles in Baltimore and Los Angeles, 1999-2008")
print(g)
dev.off()
