# This file load the specific data for evaluation test

 loadData <- function(path, folder, fileDataNames){
   dataList <- list(0) # Initialize list with a value
   i = 1
   while (i <= length(fileDataNames)) {
     dataList[[i]] <- read.csv(paste(path, folder,fileDataNames[[i]], sep = "/"), header = TRUE)
     i <- i + 1
   }
   return (dataList)
 }
 
 getTestFileNames <- function(nTest, testName, platform, device, ext){
   testFileNames <- list(0) # Initialize list whith a value
   i = 1
   while(i <= nTest){
     testFileNames[[i]] <- paste(testName, i, platform, device, ext, sep = '')
     i <- i + 1
   }
   return (testFileNames)
 }