## Aross the United States, how have emissions from coal combustion-related sources 
## changed from 1999–2008?

library(rex)

if (!exists('PM25')) {
  PM25 <- readRDS('summarySCC_PM25.rds')
}

## Obtain all SCC associated with coal
code <- readRDS('Source_Classification_Code.rds')
coal_s <- grep('Coal', code$EI.Sector)
coal_SCC <- code[coal_s,]

## Obtain all emissions associated with coal combustion
coal_PM25 <- PM25[PM25$SCC %in% coal_SCC$SCC,]
coal_PM25_agg <- aggregate(Emissions~year,coal_PM25, sum)

## Generate plot
png('plot4.png',
    width = 600,
    height = 600,
    units = 'px')

title <- 'Coal-combustion associated PM2.5 emission in US 1999-2008'
ggplot(coal_PM25_agg, aes(year, Emissions)) + geom_line() + theme_bw() +
  labs(title = title) + ylim(c(0,600000)) + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))

dev.off()

