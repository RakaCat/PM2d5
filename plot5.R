## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

#Check Baltimore data and raw data
if (!exists('PM25')) {
  PM25 <- readRDS('summarySCC_PM25.rds')
}

if (!exists('Bltm')) {
  Bltm <- PM25[PM25$fips == '24510', ]
}
code <- readRDS('Source_Classification_Code.rds')


##Focus on motor vehicle sources
veh_SCC <- code[grep('Highway Vehicles', code$SCC.Level.Two), 1]
veh_bltm <- Bltm[Bltm$SCC %in% veh_SCC,]

#Plot parameters
title <- 'PM2.5 emission from motor vehicles in Baltimore City'

#Generate plot
png('plot5.png')
ggplot(veh_bltm, aes(Emissions)) + 
  geom_histogram(bins = 15) + scale_x_log10() + 
  facet_grid(year ~ .) + labs(title = title) + theme_minimal() 
dev.off()