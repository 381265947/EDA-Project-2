
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

#setwd("C:/M/coursera/exploratory data analysis/project 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- unique(NEI$year)
tpme <- sapply(years, function (x) sum(NEI[NEI$year == x, "Emissions"]))

vehicle_rows = grep("veh", SCC[,4], ignore.case = TRUE)
sccs <- SCC[vehicle_rows, 1]
data <- NEI[NEI$fips == "24510" & NEI$SCC %in% sccs,]

years <- unique(data$year)
tpme <- sapply(years, function (x) sum(data[data$year == x, "Emissions"]))

plot(years, tpme, type = "b", xlab = "Year", ylab = "Emissions", main = "Yearly Emissions for Vehicles in Baltimore")

dev.copy(png, "plot5.png", width=5, height=5, units="in", res=100)
dev.off()