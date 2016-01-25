# Download file and unzip file
project2 <- unzip("exdata-data-NEI_data.zip")  
NEI <- readRDS("summarySCC_PM25.rds")
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#First we need to subset the data
newdata <- NEI[(NEI$fips == "24510"),]
#Aggregate the data to prepare for the barplots
data <- aggregate(Emissions~year, newdata, sum)
barplot(data$Emissions, names.arg=data$year, xlab="years", ylab=expression('Total PM '[2.5]*' Emission'), main=expression('Total PM '[2.5]*' Emissions at Various Years in Baltimore, Maryland'))
dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()
