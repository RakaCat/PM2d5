## Of the four types of sources indicated by the  (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system
## to make a plot answer this question.

library(ggplot2)

#Load data if it doesn't exist
if (!exists('PM25')) {
  PM25 <- readRDS('summarySCC_PM25.rds')
}
if (!exists('Bltm')) {
  Bltm <- Bltm <- PM25[PM25$fips == '24510', ]
}

Bltm$type <- as.factor(Bltm$type)

#set plot parameters
png('plot3.png',
    width = 600,
    height = 600,
    units = 'px')

title <- 'Change in PM2.5 emission in Baltimore City, Maryland'
ylab <- 'log(PM2.5 Emission)'

#generate plot
ggplot(data = Bltm, aes(year, Emissions, color = type)) + 
  geom_jitter(alpha = 0.45) + geom_line(data = Bltm.by_source, size = 1.5) + 
  scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) + scale_y_log10() + 
  labs(title = title, y = ylab) + theme_bw()
dev.off()

#General decrease trend is observed. There's a peak of POINT PM2.5 source in 2005