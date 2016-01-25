project2 <- unzip("exdata-data-NEI_data.zip") 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#load librarys
library(dplyr)
library(ggplot2)
#subset data
Baltimore_data <- filter(NEI, fips == "24510", type == "ON-ROAD")
LA_data <- filter(NEI, fips == "06037", type == "ON-ROAD")
#aggregate data
Baltimore_aggdata <- aggregate(Emissions~year, Baltimore_data, sum)
LA_aggdata <- aggregate(Emissions~year, LA_data, sum)
#plot data
Baltimore <- ggplot(Baltimore_aggdata,aes(factor(year),Emissions)) + geom_bar(stat="identity") + xlab("Year") + ylab("Total PM '[2.5]*' Emission") + ggtitle("BALTIMORE Emissions From Motor Vehicle-Related Sources")
LA <- ggplot(LA_aggdata, aes(factor(year),Emissions)) + geom_bar(stat="identity") + xlab("Year") + ylab("Total PM '[2.5]*' Emission") + ggtitle("LA Emissions From Motor Vehicle-Related Sources")
graph <- multiplot(Baltimore, LA, cols=2)
print(graph)
dev.copy(png, file="plot6.png",width=800, height=800)
dev.off()
#### Here is the multiplot function found online
multiplot <- function(..., plotlist = NULL, file, cols = 1, layout = NULL) {
  require(grid)
  
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots == 1) {
    print(plots[[1]])
    
  } else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    for (i in 1:numPlots) {
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


LA <- ggplot(LA_aggdata,aes(factor(year),Emissions))
