## Assortment of scripts for solving the project assignment

## NB! Bruk method = "libcurl". 
## NB2! For nedlasting av binærfiler: Bruk method = "wb"

## Denne legger fila rett i Working Directory

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destination <- "./data/wearable.zip"

project <- function(){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        destination_directory <- "./data"
        destination_filename <- "wearable.zip"
        destination <- paste(c(destination_directory, "/", destination_filename), sep = "")
        
        if (!file.exists(destination_directory)) {
                dir.create(destination_directory)
                print("Data directory created.")
        } else print("Data directory already existed.")
        
        if (!file.exists(destination)) {
                download.file(fileUrl, destfile = destination, method = "libcurl", mode = "wb")
                dateDownloaded <- date()
                unzip(destination)
                print("File downloaded and unziped.")
        } else print("File already downloaded and unziped.")
        
        ## read.table() is reliable and robust, but somewhat slow.
        ## Requires more params than other similar functions.
        ## Not suited for large data sets. Reads into memory.
        ## Probably good for learning, though.
        
        ## Params: file, header, sep, row.names, nrows, quote, ma.strings, skip
        ## It is recommended to try quote = "" if trouble with quotation marks.
        
        ## Can probably make use of nrows to speed up during development.
        
        X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = TRUE, nrows = 20)
        print(str(X_test))
        
}



