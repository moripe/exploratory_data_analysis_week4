## This first line will likely take a few seconds. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.


head(NEI)
aggregaTot_by_year <- aggregate(Emissions ~ year, NEI, sum)

png('Plot1.png')
barplot(height=aggregaTot_by_year$Emissions, 
        names.arg=aggregaTot_by_year$year, xlab="Years", 
        ylab=expression('PM2.5 Emissions in tons'),
        main=expression('Total PM2.5 emissions at various years'))
dev.off()
