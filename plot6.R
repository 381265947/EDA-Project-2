
# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

setwd("C:/M/coursera/exploratory data analysis/project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- unique(NEI$year)
tpme <- sapply(years, function (x) sum(NEI[NEI$year == x, "Emissions"]))

vehicle_rows = grep("veh", SCC[,4], ignore.case = TRUE)
sccs <- SCC[vehicle_rows, 1]
data <- NEI[NEI$SCC %in% sccs,]

years <- unique(data$year)
tpmeBA <- sapply(years, function (x) sum(data[data$fips == "24510" & data$year == x, "Emissions"]))
tpmeLA <- sapply(years, function (x) sum(data[data$fips == "06037" & data$year == x, "Emissions"]))

cols = rainbow(2)
plot(years, c(0, 0, 5000, 5000), type = "n", xlab = "Year", ylab = "PM2.5 Emissions", main = "Vehicle Emissions in Baltimore and Los Angeles")
lines(years, tpmeBA, type = "b", col = cols[1])
lines(years, tpmeLA, type = "b", col = cols[2])
legend('topright', c("Baltimore", "Los Angeles"), lty = 1, col = cols, bty = "n")

dev.copy(png, "plot6.png", width=7, height=7, units="in", res=100)
dev.off()