
## This first line will likely take a few seconds. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.


# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
agregaTotal_Baltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

library(ggplot2)
png("Plot3.png")



ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y="Total PM2.5 Emission in Tons") + 
  labs(title="PM2.5 Emissions, Baltimore City 1999-2008 by Source Type")

print(ggp)

dev.off()
