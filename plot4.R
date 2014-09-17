
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#setwd("C:/M/coursera/exploratory data analysis/project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- unique(NEI$year)
tpme <- sapply(years, function (x) sum(NEI[NEI$year == x, "Emissions"]))

coal_rows = grep("coal", SCC[,4], ignore.case = TRUE)
comb_rows = grep("comb", SCC[,4], ignore.case = TRUE)
both_rows = intersect(coal_rows, comb_rows)
sccs <- SCC[both_rows, 1]
data <- NEI[NEI$SCC %in% sccs,]

years <- unique(data$year)
tpme <- sapply(years, function (x) sum(data[data$year == x, "Emissions"]))

barplot(tpme, main="Coal Combustion Emissions per Year in the US", names.arg = years)

dev.copy(png, "plot4.png", width=5, height=5, units="in", res=100)
dev.off()