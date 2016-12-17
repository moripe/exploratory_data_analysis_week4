
## This first line will likely take a few seconds. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip 24510

baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
agregaTotal_Baltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("Plot2.png")

barplot(
  agregaTotal_Baltimore$Emissions,
  names.arg=agregaTotal_Baltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions in tons",
  main="Total PM2.5 Emissions From Baltimore"
)

dev.off()
