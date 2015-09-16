quiz1 <- function() {
        
        filename <- "./microdata.csv"
        inputfile <- read.table(filename,
                                sep = ",",
                                header = TRUE)
        
        overmill <- inputfile$VAL
        ##print(str(inputfile))
        print(length(overmill))
        print(head(overmill))
        print(class(overmill))
        print(max(overmill))
        print(sum(na.exclude(overmill[]) == 24))
}

## install.packages("RCurl")
## What did I do:
## setInternet2(use = TRUE) fra en hjelpesidetråd
## install.packages("RCurl") ## var visst gjort fra før
## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
## download.file(fileUrl, destfile="./data/gas.xlsx", method="libcurl", mode='wb')
## dateDownloaded <- date()
## Etter litt om og men - måtte installere Java på maskinen.
## Mer om og men - måtte installere Java 64 bit på maskinen (fra manuell nedlasting på Java.com)
## install.packages('xlsx') ## Tips fra https://class.coursera.org/getdata-031/forum/thread?thread_id=53
## Usikker på forrige linje. Trengte ikke gjøre det på nytt etter 64-bit-installasjon.
## library(xlsx) - Og nå virket det! Kommer endelig videre.
## install.package("data.table")
## library(data.table)

quiz2 <- function() {
        filename <- "./data/gas.xlsx"
        dat <- read.xlsx(filename,
                         sheetIndex = 1,
                         startRow = 18,
                         endRow = 23,
                         colIndex = 7:15,
                         header = TRUE)
        
        sum(dat$Zip*dat$Ext,na.rm=T)
}
## Question 4
## install.packages("XML")
## library(XML)
## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
## Erstattet https med http for å få det til å virke
## fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
## doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
## rootNode <- xmlRoot(doc)
## sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")

## Question 5
## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
## download.file(fileUrl, destfile="./data/housing.csv", method="libcurl")
## DT <- fread("./data/housing.csv")

quiz2_5 <- function(x) {
        print("x * mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)")
        print("Looong time")
        ##print(system.time(
        ##        for(i in 1:x) {
        ##                mean(DT[DT$SEX==1,]$pwgtp15)
        ##                mean(DT[DT$SEX==2,]$pwgtp15)
        ##        }
        ##))
        print("x * sapply(split(DT$pwgtp15,DT$SEX),mean)")
        print(system.time(
                for(i in 1:x) {
                        sapply(split(DT$pwgtp15,DT$SEX),mean)
                }
        ))
        print("x * tapply(DT$pwgtp15,DT$SEX,mean)")
        print("Marginally slower than the two winners")
        ##print(system.time(
        ##        for(i in 1:x) {
        ##                tapply(DT$pwgtp15,DT$SEX,mean)
        ##        }
        ##))
        print("x * mean(DT$pwgtp15,by=DT$SEX)")
        print("Galt svar")
        ##print(system.time(
        ##        for(i in 1:x) {
        ##                mean(DT$pwgtp15,by=DT$SEX)
        ##        }
        ##))
        print("x * DT[,mean(pwgtp15),by=SEX]")
        print(system.time(
                for(i in 1:x) {
                        DT[,mean(pwgtp15),by=SEX]
                }
        ))
        print("x * rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]")
        print("does not work")
        ##print(system.time(
        ##        for(i in 1:x) {
        ##                rowMeans(DT)[DT$SEX==1]
        ##                rowMeans(DT)[DT$SEX==2]
        ##        }
        ##))
}
