setwd("F:/Kaggle DataSet/foreign_Exchange_Rates")


library(ggplot2)
library(dplyr)

##Loading the csv file..

DailyData <- read.csv("Foreign_Exchange_Rates.csv", na.strings = "ND")
mean(is.na(DailyData))

##Changing the date column to Date Class..

DailyData$Time.Serie <- as.Date(as.character(DailyData$Time.Serie), "%Y - %m - %d")
class(DailyData$Time.Serie)

##Changing the name of Column

names(DailyData)[2] <- "Date"

##Removing NA from columns..

DailyData <- na.omit(DailyData)


#rm(DailyData1)
par(mfrow = c(2,1))

dev.copy(png, "Australian_Dollars_wrt_USD.png")

ggplot(DailyData, aes(Date,AUSTRALIA...AUSTRALIAN.DOLLAR.US.)) + 
  geom_line(size =1, color = "#E46726") +
  ylab("Australian Dollar")+
       xlab("Year")
dev.off()

dev.copy(png, "Euro_wrt_USD.png")

ggplot(DailyData, aes(Date,EURO.AREA...EURO.US.)) + 
  geom_line(size =1, color = "blue") +
  xlab("Year")+
       ylab("Euro Rates")

dev.off()

dev.copy(png, "Indian_Rupees_wrt_USD.png")

ggplot(DailyData, aes(Date,INDIA...INDIAN.RUPEE.US.)) + 
  geom_line(size =1, color = "black") +
  ylab("Indian Rupees")+
  xlab("Year")

dev.off()