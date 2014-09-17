
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

#setwd("C:/M/coursera/exploratory data analysis/project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bcd <- NEI[NEI$fips == "24510",]
years <- unique(bcd$year)
types <- unique(bcd$type)

z <- sapply(types, function (t) {
		sapply(years, function (y) {
			sum(bcd[bcd$year == y & bcd$type == t, "Emissions"])
		})
	})

cols <- rainbow(ncol(z))
plot(years, c(0, 0, 2200, 2200), type = "n", xlab = "Year", ylab = "PM2.5 Emissions", main = "Emissions per year per type in Baltimore")

for(i in 1:ncol(z)){ 
	lines(years, z[,i], type = "b", col = cols[i])
}

legend('topright', colnames(z), lty = 1, col = cols, bty = "n")

dev.copy(png, "plot3.png", width=7, height=7, units="in", res=100)
dev.off()