

## This first line will likely take a few seconds. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999–2008?

# Subset coal combustion related NEI data
combustion_related <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal_related <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coal_combustion <- (coal_related & coal_related)
combustion_SCC <- SCC[coal_combustion,]$SCC
combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]

png("Plot4.png")

library(ggplot2)

ggp <- ggplot(combustion_NEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() + 
  labs(x="Year", y="Total PM2.5 Emission (10^5 Tons)") + 
  labs(title="PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")

print(ggp)

dev.off()
