## Question addressed: 
## 1. Have total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008? Using the base plotting system, make a plot showing 
## the total PM2.5 emission from all sources for each of the years 
## 1999, 2002, 2005, and 2008. 

PM25 <- readRDS('summarySCC_PM25.rds')
Q1.magg <- aggregate(Emissions ~ year, data = PM25, FUN = mean)
png('plot1.png')
with(Q1.magg, plot(year, Emissions, main = 'Total pm2.5 emission from all sources in 1999 to 2008'))
dev.off()