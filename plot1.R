
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

#setwd("C:/M/coursera/exploratory data analysis/project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- unique(NEI$year)
tpme <- sapply(years, function (x) sum(NEI[NEI$year == x, "Emissions"]))
barplot(tpme, main="PM2.5 Emissions per Year", names.arg = years)

dev.copy(png, "plot1.png", width=5, height=5, units="in", res=100)
dev.off()