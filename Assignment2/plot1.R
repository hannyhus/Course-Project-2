# Download file and unzip file
project2 <- unzip("exdata-data-NEI_data.zip")  
NEI <- readRDS("summarySCC_PM25.rds")
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#After calling the dim(), str(), and head() you will notice we need to alter the data a bit. Barplots can represent not only counts or frequencies but means, medians, std,etc. We need to use the aggregate() function and pass the results on to the barplot function (www.statmethods.net/graphs/bar.html)
data <- aggregate(Emissions~year, NEI, sum)
#Create Barplot
barplot(data$Emissions,names.arg=data$year,xlab="years",ylab=expression('Total PM '[2.5]*' emission'),main=expression('Total PM'[2.5]*'Emissions at Various Years'))
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()