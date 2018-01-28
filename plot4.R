## Download data from web and unzip locally

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "NEI_data.zip")
unzip("NEI_data.zip", exdir=".", overwrite=TRUE)

## Load data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

NEISCC <- merge(NEI, SCC, by="SCC")
allCoal  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
coalNEISCC <- NEISCC[allCoal, ]

yearEmissions <- aggregate(Emissions ~ year, coalNEISCC, sum)

png("plot4.png")
g <- ggplot(yearEmissions, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total Emission')) +
  ggtitle('Total Emission from Coal sources, 1999-2008')
print(g)
dev.off()

