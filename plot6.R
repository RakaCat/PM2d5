## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California.
## Which city has seen greater changes over time in motor vehicle emissions?


library(ggplot2)


#Check Baltimore data and raw data

if (!exists('PM25')) {
  PM25 <- readRDS('summarySCC_PM25.rds')
}
if (!exists('Bltm')) {
  Bltm  <- PM25[PM25$fips == '24510',]
}
if (!exists('code')) {
  code <- readRDS('Source_Classification_Code.rds')
}
if (!exists('veh_bltm')) {
  veh_SCC <- code[grep('Highway Vehicles', code$SCC.Level.Two), 1]
  veh_bltm <- Bltm[Bltm$SCC %in% veh_SCC, ]
}


#Obtain LA data and select vehicles only
LA <- PM25[PM25$fips == '06037',]
veh_la <- LA[LA$SCC %in% veh_SCC, ]

#Prepare data
veh_la$Location <- 'Los Angeles County'
veh_bltm$Location <- 'Baltimore City'
d <- rbind(veh_bltm[3:7], veh_la[3:7])

#plot
title <- 'Vehicle-associated PM2.5 emission in LA and Baltimore City'
png('plot6.png')
ggplot(d, aes(year, Emissions, colour = Location)) + geom_jitter() + 
  scale_y_log10() + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) + 
  geom_smooth(method = 'loess') + labs(title = title) + theme_minimal()
dev.off()
