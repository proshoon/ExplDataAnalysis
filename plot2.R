## Download data from web and unzip locally

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "NEI_data.zip")
unzip("NEI_data.zip", exdir=".", overwrite=TRUE)

## Load data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? Use the base plotting system to make a plot answering this question.

balNEI <- NEI[NEI$fips=="24510", ]
yearEmissions <- aggregate(Emissions ~ year, balNEI, sum)
png('plot2.png')
barplot(height=yearEmissions$Emissions, names.arg=yearEmissions$year, xlab="Year", ylab=expression('Total Emission'),main=expression('Total Emissions in Baltimore City in Different Years'))
dev.off()
