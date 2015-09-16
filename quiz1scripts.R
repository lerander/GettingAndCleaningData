## Diverse scripts for å løse Quiz 1

## NB! Bruk method = "libcurl". 
## NB! For nedlasting av binærfiler: Bruk method = "wb"

some_prerequisites <- function() {
        last_ned_pdf <- function(){
                download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf",
                              destfile = "forklaring.pdf", method = "libcurl", mode="wb")
        }
}

quiz1 <- function() {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        destination_directory <- "./data"
        destination_filename <- "husfil.csv"
        destination <- paste(c(destination_directory, "/", destination_filename), sep = "")
        
        if (!file.exists(destination_directory)) {
                dir.create(destination_directory)
                print("Data directory created.")
        } else print("Data directory already existed.")
        
        if (!file.exists(destination)) {
                download.file(fileUrl, destfile = destination, method = "libcurl")
                dataDownloaded <- date()
                print("File downloaded")
        } else print("File previously downloaded.")
        
        ## La oss allerede nå bruke data.table()-pakken. Denne skal være
        ## raskere og mer anvendelig enn vanlige data.frame-operasjoner.
        library(data.table)
        
        ##NB! I videoen "The data.table Package", slide 9, dukker det opp noe
        ## som trolig er viktig - hvordan subsette og aggregere på samme tid
        ## i en data.table. DT[, list(mean(x), sum(z))]. Dette tipper jeg er
        ## ekstremt nyttig etterhvert...
        ## Og slide 10: Legg til ny kolonne: DT[, w:=z^2]
        ## Eller legge på en kondisjonell kolonne: DT[,a:=x>0]
        ## Eller slide 17, bruk keys til enkel subsetting
        
        ##husfil <- read.table(destination_filename, header=TRUE, sep = ",")
        husfil <- fread(destination_filename)
        ##str(husfil)
        ## Skal finne antall boliger med VAL = 24
        ##husfil[, a:=VAL==24]
        ##setkey(husfil, VAL)
        str(husfil[VAL == 24])
        
        ##str(husfil)
        
        
}