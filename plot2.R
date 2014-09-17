
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

#setwd("C:/M/coursera/exploratory data analysis/project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- unique(NEI$year)
tpme <- sapply(years, function (x) sum(NEI[NEI$fips == "24510" & NEI$year == x, "Emissions"]))
barplot(tpme, main="PM2.5 Emissions per Year in Baltimore", names.arg = years)

dev.copy(png, "plot2.png", width=5, height=5, units="in", res=100)
dev.off()