## Have total emissions from PM2.5 decreased 
## in the Baltimore City, Maryland from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.


if(!exists('PM25')){PM25 <- readRDS('summarySCC_PM25.rds')}

Bltm <- PM25[PM25$fips=='24510', ]
Bltm.sum <- aggregate(Emissions~year, Bltm, sum)
png('plot2.png')
main = 'Total PM2.5 emission in Baltimore City, Maryland, from 1999 to 2008'
with(Bltm.sum, plot(year, Emissions, type = 'l', main = main))
dev.off()
