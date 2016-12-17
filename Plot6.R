



## This first line will likely take a few seconds. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
vehicles_Baltimore_NEI <- vehicles_NEI[vehicles_NEI$fips=="24510",]
vehicles_Baltimore_NEI$city <- "Baltimore City"

vehicles_LANEI <- vehicles_NEI[vehicles_NEI$fips=="06037",]
vehicles_LANEI$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
both_NEI <- rbind(vehicles_Baltimore_NEI,vehicles_LANEI)

png("Plot6.png")

library(ggplot2)

ggp <- ggplot(both_NEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  theme_bw() +
  labs(x="Year", y="Total PM2.5 Emission (Kilo-Tons)") + 
  labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore & Los Angeles, 1999-2008")

print(ggp)

dev.off()
