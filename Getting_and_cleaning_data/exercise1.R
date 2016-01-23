###Exercise 1
getwd()
library("dplyr")
setwd("F:\\Analytics\\Moocs\\DS-Coursera\\Exercise\\Getting_and_cleaning_data\\")
getwd()

file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(file_url,'Fss06hid.csv')

sf <- read.csv('Fss06hid.csv')
sf1 <- tbl_df(sf)
property <- select(sf1,VAL)
nrow(filter(property,VAL == '24'))

file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(file_url,'gov_NGAP.xlsx',mode = 'wb')
library(xlsx)

dat <- read.xlsx('gov_NGAP.xlsx',rowIndex = 18:23,colIndex = 7:15,sheetIndex = 1)
summary(dat)
sum(dat$Zip*dat$Ext,na.rm=T)


###Read XML files
install.packages("XML")
library("XML")
library(RCurl)
file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml '
xData <- getURL(file_url )
doc <- xmlTreeParse(xData  ,useInternal = TRUE)
  doc
rootnode <- xmlRoot(doc)
xmlName(rootnode)
names(rootnode)
rootnode[[1]][[1]][[2]]

xmlSApply(rootnode,xmlValue)
zipcode <- xpathSApply(rootnode,"//zipcode",xmlValue)
zip_21231 <- zipcode[zipcode == '21231']
length(zip_21231)
  
xml2df <- xmlToDataFrame(doc)  
 
####
file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(file_url,'Fdatapid.csv')

require(data.table)
DT <- fread("Fdatapid.csv")
summary(DT)
