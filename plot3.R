## Download data from web and unzip locally

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "NEI_data.zip")
unzip("NEI_data.zip", exdir=".", overwrite=TRUE)

## Load data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the  (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

balNEI <- NEI[NEI$fips=="24510", ]
yearTypeEmissions <- aggregate(Emissions ~ year + type, balNEI, sum)
png("plot3.png")
g <- ggplot(yearTypeEmissions, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab(expression('Total Emission')) +
  ggtitle('Total Emission in Baltimore, 1999 to 2008')
print(g)
dev.off()

