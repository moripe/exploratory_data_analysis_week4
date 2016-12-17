



## This first line will likely take a few seconds. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltimore_vehiclesNEI <- vehicles_NEI[vehicles_NEI$fips=="24510",]

png("Plot5.png")

library(ggplot2)

ggp <- ggplot(baltimore_vehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +
  labs(x="Year", y="Total PM2.5 Emission (10^5 Tons)") + 
  labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")

print(ggp)

dev.off()
