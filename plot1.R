## Download data from web and unzip locally

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "NEI_data.zip")
unzip("NEI_data.zip", exdir=".", overwrite=TRUE)

## Load data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

yearEmissions <- aggregate(Emissions ~ year, NEI, sum)
png("plot1.png")
barplot(height=yearEmissions$Emissions, names.arg=yearEmissions$year, xlab="Year", ylab=expression("Total Emission"),main=expression("Total Emissions in Different Years"))
dev.off()
