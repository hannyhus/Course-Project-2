# Download file and unzip file
project2 <- unzip("exdata-data-NEI_data.zip")  
NEI <- readRDS("summarySCC_PM25.rds")
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
#Subset correct data
newdata <- NEI[(NEI$fips == "24510"),]
#Aggregate data accordingly
data <- aggregate(Emissions~year+type,newdata,sum)
#source ggplot2 package
library(ggplot2)
g <- ggplot(data,aes(year,Emissions,color=type))
g + geom_line() + xlab("Years") + ylab("Total PM '[2.5]*' Emission") + ggtitle("Total PM '[2.5]*' Emissions at Various Years in Baltimore, Maryland")
dev.copy(png, file="plot3.png",width=480, height=480)
dev.off()
